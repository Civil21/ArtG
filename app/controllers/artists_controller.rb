class ArtistsController < ApplicationController
	before_action :get_artist, only:[:show,:edit,:update,:destory]

	def index
		@artists=Artist.all
	end

	def show

	end

	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def delete
		
	end

	private 

	def get_artist
		@artist = Artist.find_by(name: params[:id])
	end

end
