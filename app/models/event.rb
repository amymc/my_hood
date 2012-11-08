class Event < ActiveRecord::Base
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

