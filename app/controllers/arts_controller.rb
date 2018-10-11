class ArtsController < ApplicationController
	before_action :aut_artist!, except:[:show,:index]
	before_action :get_art,except:[:index,:new,:create]
	before_action :get_artist, except:[:index]

	def index
    if(Artist.find_by(name: params[:artist_id])|| Artist.find_by(id: params[:artist_id]))
      @artist = Artist.find_by(name: params[:artist_id])
      @artist ||=Artist.find(params[:artist_id])
      @arts=Art.where(artist_id: @artist.id)
    else
      @arts=Art.all
    end
  end

  def show
  
  end

	def new
    @navbar_off = true	
    @groups = CategoryGroup.all
    @categories = []
    @groups.each{|group|
      @categories[group.id] = Category.where(category_group_id: group.id)
      }
  end

  def create
  	params[:art][:artist_id]=@current_artist.id
    @categories = Category.find(params[:categories_ids])
  	@art=Art.create(art_params)
    @art.categories = @categories
  	if @art.save
		redirect_to artist_art_path(@artist.name,@art.id)  		
    else
  		render 'new'
  	end
  end

  def edit
	 @navbar_off = true	  		
  end

  def update
    if @art.artist.id == @current_artist.id
      @categories = Category.find(params[:categories_ids])
      @art.categories.clear
      @art.categories = @categories
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
  	params.require(:art).permit(:name,:description,:artist_id,:price,:picture)
  end
end
