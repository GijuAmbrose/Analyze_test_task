class CreateClientTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :client_types do |t|
      t.belongs_to :sector
      t.string :client_type

      t.timestamps
    end
  end
end
