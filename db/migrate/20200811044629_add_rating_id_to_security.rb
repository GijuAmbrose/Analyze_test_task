class AddRatingIdToSecurity < ActiveRecord::Migration[6.0]
  def change
    add_reference :securities, :rating, null: false, foreign_key: true
  end
end
