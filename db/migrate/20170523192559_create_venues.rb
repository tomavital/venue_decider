class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.text :name
      t.text :address
      t.integer :cuisine
      t.integer :average_price
      t.text :website

      t.timestamps

    end
  end
end
