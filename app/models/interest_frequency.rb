class InterestFrequency < ApplicationRecord
  has_many :securities
  validates :frequency, presence: true
end
