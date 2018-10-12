class CategoryGroupsController < ApplicationController

	def index
		@groups = CategoryGroup.all
		@categories = []
		@groups.each{|group|
			@categories[group.id] = Category.where(category_group_id: group.id)
			}
	end

	def show
		@group = CategoryGroup.find_by(name: params[:id])
		@group ||=CategoryGroup.find_by(id: params[:id])
		@categories = Category.where(category_group_id: @group.id)
	end

end
