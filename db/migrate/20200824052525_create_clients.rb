class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.belongs_to :client_type
      t.belongs_to :sector
      t.belongs_to :state
      t.belongs_to :town
      t.string :name
      t.string :address
      t.string :pin
      t.integer :phone
      t.string :email
      t.string :website
      t.string :aum
      t.string :subdomain

      t.timestamps
    end
  end
end
