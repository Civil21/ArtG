class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :password
      t.string :description
      t.string :phone
      t.string :email
      t.string :link

      t.timestamps
    end
  end
end
