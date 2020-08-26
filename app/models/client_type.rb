class ClientType < ApplicationRecord
  belongs_to :sector
  has_many :clients
end
