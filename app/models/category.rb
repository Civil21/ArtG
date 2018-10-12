class Category < ApplicationRecord
	belongs_to :category_group
	has_and_belongs_to_many :arts
end
