class Issuer < ApplicationRecord
  has_many :security_types
  has_many :securities
end
