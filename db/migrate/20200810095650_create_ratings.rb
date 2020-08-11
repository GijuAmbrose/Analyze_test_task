class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :rating
      t.belongs_to :rating_agency
      t.timestamps
    end
  end
end
