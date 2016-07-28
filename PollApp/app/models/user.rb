class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Response

  has_many :answered_questions,
    through: :responses,
    source: :question



  def all_answered_qs
    all_questions = self.answered_questions
    count_questions = Hash.new(0)
    all_questions.each do |question|
      count_questions[question.poll] += 1
    end
      # .select("polls.*")
    count_questions
      # .joins("polls ON polls.author_id")
  end

  def results
    result = self
      .answered_questions
      .includes(:poll)

    count_questions = Hash.new(0)
    result.each do |question|
      question.poll.questions.each do |question|
        count_questions[question.poll] += 1
      end
    end
    count_questions
  end

  def completed_polls
    completed = []
    answered_qs = all_answered_qs
    result_hash = results
    answered_qs.each do |poll, count|
        if count == result_hash[poll]
          completed << poll
        end
    end
    completed
  end

end
