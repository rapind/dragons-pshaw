class Question < ActiveRecord::Base
  belongs_to :standard

  validates :label, presence: true
end
