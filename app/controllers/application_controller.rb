class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception
  	before_action :get_current_artist,except:[:aut_artist!]

  	private 

  	def get_current_artist
  		if(session[:current_artist_id])
  			@current_artist=@current_artist=Artist.find(session[:current_artist_id])
  		end
  	end

	def aut_artist!
		if(session[:current_artist_id])
			redirect_to sign_in_path
		else
			get_current_artist
		end
	end
end
