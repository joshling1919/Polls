class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response

  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:duplicate] << "response already exists"
    end
  end

  def sibling_responses
    self.question.responses
  end

  def respondent_already_answered?
    id = self.user_id
    sibling_responses.exists?(user_id: id)
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question


  def inspect
    "#{respondent.user_name} said: #{answer_choice.answer_text}"
  end

end
