class CreateCuisines < ActiveRecord::Migration[5.0]
  def change
    create_table :cuisines do |t|
      t.text :cuisine_name

      t.timestamps

    end
  end
end
