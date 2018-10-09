class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	private 

	def aut_artist!
		@current_artist = session[:current_artist]
		@name = @current_artist.email
		if(!@current_artist)
			redirect_to sign_in_path
		end
	end
end
