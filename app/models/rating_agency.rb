class RatingAgency < ApplicationRecord
  has_many :ratings
  has_many :securities
  validates :rating_agency_name, uniqueness: { scope: :rating_agency_name }
  validates :rating_agency_name, presence: true
end
