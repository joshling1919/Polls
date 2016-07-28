require "answer_choice"

class Question < ActiveRecord::Base
  validates :poll_id, :question_text, presence: true
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # def results
  #   results = self.responses
  #
  #   count = Hash.new(0)
  #   results.each do |result|
  #     count[result.answer_choice.answer_text] += 1
  #   end
  #   count
  # end

  # def results
  #   results = self.answer_choices.includes(:responses).count
  #
  #   # count = Hash.new(0)
  #   count = {}
  #   results.each do |result|
  #     count[result.answer_text]
  #   end
  #   count
  # end

  def results



    results = self
      .answer_choices
      .select("answer_choices.answer_text, COUNT(*) AS response_count")
      # .joins(<<-SQL).group("answer_choices.id")
      #   LEFT OUTER JOIN responses
      #     ON answer_choices.id = responses.answer_choice_id
      #   SQL
      .join("LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id")
      .group("answer_choices.id")

    count = {}
    results.each do |result|
      count[result] = result.response_count
    end
    count
  end
end
