class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	private 

	def aut_artist!
		if(session[:current_artist_id]==nil)
			redirect_to sign_in_path
		else
			@current_artist=Artist.find(session[:current_artist_id])
		end
	end
end
