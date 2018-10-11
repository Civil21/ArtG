class CategoriesController < ApplicationController

	def index
		@categoris = Category.all
	end

	def show
		@category = Category.find_by(name: params[:id])
		@category ||=Category.find_by(id: params[:id])
		@arts = @category.arts
	end

end
