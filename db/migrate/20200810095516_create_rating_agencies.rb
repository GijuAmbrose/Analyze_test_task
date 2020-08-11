class CreateRatingAgencies < ActiveRecord::Migration[6.0]
  def change
    create_table :rating_agencies do |t|
      t.string :rating_agency_name

      t.timestamps
    end
  end
end
