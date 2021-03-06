class Event < ActiveRecord::Base
	#belongs_to :maps
	attr_accessible :location, :latitude, :longitude
	#attr_accessor :location
 	geocoded_by :location #:latitude, :longitude
    reverse_geocoded_by :latitude, :longitude
    #performs geocoding everytime a new event is added to the database or an address is updated
 	after_validation :geocode, :if => :location_changed?
 	# Gmaps4rails
	acts_as_gmappable #:process_geocoding => false #:lat => :lat, :lng => :lng
	#validates fields in the 'edit' and 'create new' forms
	validates_presence_of :title, :description, :location
	#adding the image uploader
	mount_uploader :image, ImageUploader
	


      #def gmaps4rails_location
      #    location
      #end
      
       def gmaps4rails_address
    		"#{self.latitude}, #{self.longitude}"
  	   end



      
     #adds infowindow which displays title and location of event and links to event show page
     def gmaps4rails_infowindow
          "<a href = '/events/#{id}'>#{title} <br/> #{location}</a>"
     end
     
	def eventsArray
		userLocation = params[:latitude], params[:longitude]
		@events = Event.near(userLocation,2)
	end


	def self.search(search)
		if search
			#events = Event.find_all_by_description (params[:search])
			#find(:all,:conditions => ['title LIKE ?', "%#{search}%"])

  
			find(:all,:conditions => ['title LIKE :search OR description LIKE :search OR location LIKE :search OR genre LIKE :search ', {:search =>"%#{search}%"}])
			#All.where('title <=? LIKE ?', "%#{ search_query}%"])
		#event = Event.where(params[:search])
			#Event.where("title like ?", params[:search]+"%")
		
  			#search_condition = "%" + search + "%"
  			#find(:all, :conditions => ['title LIKE ?', OR description LIKE ?', search_condition, search_condition])
  		
  			#find(:all,:conditions => ['description LIKE ?', "%#{search}%"])	
  			
		else
			find(:all)
		end
	end
end

