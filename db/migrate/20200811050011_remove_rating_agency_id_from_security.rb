class RemoveRatingAgencyIdFromSecurity < ActiveRecord::Migration[6.0]
  def change
    remove_column :securities, :rating_agency_id, :integer
  end
end
