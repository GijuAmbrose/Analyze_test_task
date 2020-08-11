class State < ApplicationRecord
  has_many :towns
  validates :state_name, presence: true
  validates :state_name, uniqueness: { scope: :state_name }
end
