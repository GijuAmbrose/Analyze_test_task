class AddAgainRatingAgencyIdToSecurity < ActiveRecord::Migration[6.0]
  def change
    add_reference :securities, :rating_agency, null: false, foreign_key: true
  end
end
