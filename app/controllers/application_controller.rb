class ApplicationController < ActionController::Base
	 protect_from_forgery
	
	#when user is not logged in access to certain controllers is denied
	rescue_from CanCan::AccessDenied do |exception|
    	redirect_to root_url,  :flash => { :error => exception.message }
    end
	 
	 	
	  	#helper_method :search_events
	  	helper_method :current_user
	 
	 private

	   	def current_user
    		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  		end
  		
#def current_ability
#  @current_ability ||= Ability.new(current_user)
#end

 
		#def search_events
  		#	@events = Event.search(params[:search])
  		#	@json = @events.to_gmaps4rails


   		#	respond_to do |format|
      	#	format.html # index.html.erb
      	#	format.json { render :json => @events }
    	#end
	  
	
end
