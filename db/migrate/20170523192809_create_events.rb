class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date
      t.time :time
      t.integer :venue_id
      t.integer :creator_id

      t.timestamps

    end
  end
end
