class Question < ActiveRecord::Base
  belongs_to :standard
  has_many :quiz_questions

  validates :label, presence: true
end
