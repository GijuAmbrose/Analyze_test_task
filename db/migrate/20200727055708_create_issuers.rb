class CreateIssuers < ActiveRecord::Migration[6.0]
  def change
    create_table :issuers do |t|
      t.text :name

      t.timestamps
    end
  end
end
