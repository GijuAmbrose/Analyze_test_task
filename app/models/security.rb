class Security < ApplicationRecord
  belongs_to :issuer
  belongs_to :security_type
  belongs_to :interest_frequency
end
