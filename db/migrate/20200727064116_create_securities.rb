class CreateSecurities < ActiveRecord::Migration[6.0]
  def change
    create_table :securities do |t|
      t.belongs_to :issuer
      t.belongs_to :security_type
      t.belongs_to :interest_frequency
      t.text :security_name
      t.text :isin
      t.date :issue_date
      t.date :maturity_date
      t.float :outstanding_stock
      t.text :face_value
      t.float :coupon_rate

      t.timestamps
    end
  end
end
