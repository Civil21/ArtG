class ArtistsController < ApplicationController
	before_action :get_artist, only:[:show,:edit,:update,:destory]

	def index
		@artists=Artist.all
	end

	def show
		@arts = Art.where(artist_name: @artist.name)
	end

	def new
		
	end

	def create
		@post=Post.create(post_params)
  		if @post.save
			redirect_to post_path(@post.id)  		
    	else
  		render 'new'
  	end
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

	def artist_params
		params.require(:artist).permit(:name,:description,:phone,:email)
	end

end
