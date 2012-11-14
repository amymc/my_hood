module ApplicationHelper
	def search
		@events = Event.search(params[:search])
	end
end


