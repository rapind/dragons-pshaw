class Standard < ActiveRecord::Base
  belongs_to :strand
  has_many :questions, -> { order: { difficulty: :desc } }

  validates :name, presence: true
end
