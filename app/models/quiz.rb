class Quiz < ActiveRecord::Base
  has_many :quiz_questions

  validates :name, presence: true
  validates :number_of_questions, presence: true, minimum: 1

  before_create :select_questions

  def select_questions
    Question.all.each do |question|

    end
  end
end
