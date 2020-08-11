class Rating < ApplicationRecord
  belongs_to :rating_agency
  has_many :securities
  validates :rating, presence: true
  validates :rating_agency_id, presence: true
end
