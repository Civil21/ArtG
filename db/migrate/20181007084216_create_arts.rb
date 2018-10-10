class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.string :name
      t.string :description
      t.integer :artist_id
      t.float :price

      t.timestamps
    end
  end
end
