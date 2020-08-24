class PortFolio < ApplicationRecord
  has_many :security
  belongs_to :client
end
