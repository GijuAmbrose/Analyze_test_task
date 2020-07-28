class CreateSecurityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :security_types do |t|
      t.belongs_to :issuer
      t.text :security_type_name

      t.timestamps
    end
  end
end
