class PagesController < ApplicationController
	#before_action :aut_artist! 

  	def index
  		@navbar_off = true
  	end
end
