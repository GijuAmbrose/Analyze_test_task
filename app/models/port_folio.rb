class PortFolio < ApplicationRecord
  has_many :security, :through => :port_folio_security
  has_many :port_folio_security
  belongs_to :client
end
