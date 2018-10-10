class ArtistsController < ApplicationController
	before_action :get_artist, only:[:show,:edit,:update,:destory]
	#before_action :aut_artist!, except:[:session_up,:sign_in]

	def index
		@artists=Artist.all
	end

	def show
		@arts = Art.where(artist_id: @artist.id)
	end

	def sign_in
		@navbar_off = true

		if(@current_artist)
			redirect_to artist_path(@current_artist.name) 
		end
		#@artist=Artist.new
	end

	def session_up
		if(!@current_artist)
			@current_artist=Artist.find_by(email: params[:artist][:email],password: params[:artist][:password])
			if(@current_artist)
				session[:current_artist_id]= @current_artist.id
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
		redirect_back fallback_location: root_path
	end

	def new
		@navbar_off = true
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
    	if @artist.id == @current_artist.id
  			#Tag.new.all_tags_c(@art,params[:art][:all_tags])
  			@artist.update(artist_params)
    	end
  		redirect_to artist_path(@artist.name)
	end

	private 

	def get_artist
		@artist = Artist.find_by(name: params[:id])
		if(!@artist)
			@artist=Artist.find_by(id: params[:id])
		end
	end

	def artist_params
		params.require(:artist).permit(:name,:password,:description,:phone,:email,:avatar)
	end

end
