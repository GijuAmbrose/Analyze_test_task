class SecurityType < ApplicationRecord
  belongs_to :issuer
  has_many :securities

  validates :security_type_name, presence: true
  validates :issuer_id, presence: true
end
