class ApplicationController < ActionController::Base
	 protect_from_forgery
	 	
	  	helper_method :search_events
	  	helper_method :current_user
	 
	 private

	   	def current_user
    		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  		end
 
		#def search_events
  		#	@events = Event.search(params[:search])
  		#	@json = @events.to_gmaps4rails


   		#	respond_to do |format|
      	#	format.html # index.html.erb
      	#	format.json { render :json => @events }
    	#end
	  
	
end
