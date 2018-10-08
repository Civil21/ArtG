class ArtistsController < ApplicationController
	before_action :get_artist, only:[:show,:edit,:update,:destory]
	before_action :aut_artist! 

	def index
		@artists=Artist.all
	end

	def show
		@arts = Art.where(artist_name: @artist.name)
	end

	def sign_in
		#@artist=Artist.new
	end

	def session_up
		if(!@current_artist)
			@current_artist=Artist.find_by(email: params[:artist][:email],password: params[:artist][:password])
			if(@current_artist)
				session[:current_artist]= @current_artist
				redirect_to artist_path(@current_artist.name)  	
			else
				render 'sign_in'
			end
		else
			redirect_to artist_path(@current_artist.name)
		end
	end

	def session_down
		reset_session
		@current_artist = nil
	end

	def new

	end

	def create
		@artist=Artist.create(artist_params)
  		if @artist.save
			redirect_to artist_path(@artist.name)  		
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
		params.require(:artist).permit(:name,:password,:description,:phone,:email)
	end

end
