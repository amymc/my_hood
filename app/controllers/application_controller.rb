class ApplicationController < ActionController::Base
	 #protect_from_forgery
	 
	 
		def search
		  @events = Event.search(params[:search])
		  redirect_to @events
		end 	
end

