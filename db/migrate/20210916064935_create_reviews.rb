class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :note
      t.integer :date_time
      t.integer :user_id
      t.integer :bakery_id

      t.timestamps
    end
  end
end
