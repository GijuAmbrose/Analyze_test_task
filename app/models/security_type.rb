class SecurityType < ApplicationRecord
  belongs_to :issuer
  has_many :securities
end
