class Sector < ApplicationRecord
  has_many :client_types
  has_many :clients
end
