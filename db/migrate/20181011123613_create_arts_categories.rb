class CreateArtsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :arts_categories, id: false do |t|
      t.integer :art_id
      t.integer :category_id
    end
  end
end
