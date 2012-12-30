module ApplicationHelper
	def search
		@events = Event.search(params[:search])
	end
	
	def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :alert then "alert alert-success"
    when :error then "alert alert-error"
    end
  end
end


