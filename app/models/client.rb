class Client < ApplicationRecord
  belongs_to :sector
  belongs_to :client_type
  belongs_to :state
  belongs_to :town
  has_one :port_folio
  has_many :securities, :through => :port_folio

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :website, :format => { :with => URI::regexp(%w(http https)), :message => "Valid URL required"}
end
