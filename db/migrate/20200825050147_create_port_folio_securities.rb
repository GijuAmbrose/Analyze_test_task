class CreatePortFolioSecurities < ActiveRecord::Migration[6.0]
  def change
    create_table :port_folio_securities do |t|
      t.references :port_folio, null: false, foreign_key: true
      t.references :security, null: false, foreign_key: true

      t.timestamps
    end
  end
end
