class Event < ActiveRecord::Base
	belongs_to :maps
	#attr_accessible :location, :latitude, :longitude
 	geocoded_by :location
 	after_validation :geocode
	acts_as_gmappable :process_geocoding => false
	

      def gmaps4rails_location
          location
      end
       def gmaps4rails_infowindow
         "<h4>#{title}</h4>" << "<h4>#{location}</h4>"
     end



	def self.search(search)
		if search
			#events = Event.find_all_by_description (params[:search])
			#find(:all,:conditions => ['title LIKE ?', "%#{search}%"])

  
			find(:all,:conditions => ['title LIKE :search OR description LIKE :search OR area LIKE :search OR genre LIKE :search ', {:search =>"%#{search}%"}])
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

