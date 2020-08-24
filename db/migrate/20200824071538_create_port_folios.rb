class CreatePortFolios < ActiveRecord::Migration[6.0]
  def change
    create_table :port_folios do |t|
      t.belongs_to :client
      t.timestamps
    end
  end
end
