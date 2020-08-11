class CreateTowns < ActiveRecord::Migration[6.0]
  def change
    create_table :towns do |t|
      t.string :town_name
      t.belongs_to :state
      t.timestamps
    end
  end
end
