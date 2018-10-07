class AddAvatarToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :avatar, :string
  end
end
