class ArtsController < ApplicationController
	before_action :aut_artist!, except:[:show,:index]
	before_action :get_art,except:[:index,:new,:create]
	before_action :get_artist 

	def index
  		@arts=Art.all
  	end

  	def show

  	end

  	def new
  		
  	end

  	def create
  		params[:art][:artist_id]=@current_artist.id
  		@art=Art.create(art_params)
  		if @art.save
			redirect_to artist_art_path(@artist.name,@art.id)  		
    	else
  			render 'new'
  		end
  	end

  	def edit
		  		
  	end

  	def update
    	if @art.artist.id == @current_artist.id
  			#Tag.new.all_tags_c(@art,params[:art][:all_tags])
  			@art.update(art_params)
    	end
  		redirect_to artist_art_path(@artist.name,@art.id)
  	end

  	def destroy
    	if @art.artist.name == @current_artist.name
  			@art.destroy
    	end
  		redirect_to artist_path(@current_artist.name)
  	end

  	private 

  	def get_artist
		@artist = Artist.find_by(name: params[:artist_id])
		@artist ||=Artist.find(params[:artist_id])
	end

  	def get_art
  		@art = Art.find(params[:id])
  	end

  	def art_params
  		params.require(:art).permit(:name,:description,:artist_id,:price)
  	end
end
