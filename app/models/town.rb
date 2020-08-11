class Town < ApplicationRecord
  belongs_to :state
  validates :town_name, uniqueness: { scope: :town_name }
  validates :town_name, presence: true
  validates :state_id, presence: true
end
