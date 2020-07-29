class CreateArchivalNdsoms < ActiveRecord::Migration[6.0]
  def change
    create_table :archival_ndsoms do |t|
      t.text :trade_indicator
      t.float :ytm
      t.float :trade_price
      t.text :face_value
      t.text :security_description
      t.text :isin
      t.time :trade_time
      t.date :trade_date

      t.timestamps
    end
  end
end
