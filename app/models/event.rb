class Event < ActiveRecord::Base
	belongs_to :maps
	attr_accessible :location, :latitude, :longitude
 	geocoded_by :location, 
 		:latitude => :lat, :longitude => :lng
 
 	after_validation :geocode
	acts_as_gmappable #:process_geocoding => false #:lat => :lat, :lng => :lng
	#adding the image uploader
	mount_uploader :image, ImageUploader
	

def lat
  center.lat
end

def lng
  center.lng
end


      def gmaps4rails_location
          location
      end
      
       def gmaps4rails_address
    		"#{self.latitude}, #{self.longitude}"
  	   end

      
     #adds infowindow which displays title and location of event and links to event show page
     def gmaps4rails_infowindow
          "<a href = '/events/#{id}'>#{title} <br/> #{location}</a>"
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

