class Strand < ActiveRecord::Base
  has_many :standards
  validates :name, presence: true
end
