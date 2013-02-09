class EventsController < ApplicationController
#applying authorization using the CanCan gem
#ensures that only logged in users can access the edit/create pages
load_and_authorize_resource


respond_to :json
respond_to :js

  #GET /events
  #GET /events.json
  def index
 
  #@search = Event.search(params[:search])  
 # @events = @search.all  
 #@events = Event.near(yourLocation)
 #@events = Event.near(params[:yourLocation])
 #respond_with @events
#@events = Event.near(Gmaps.map.userLocation, 2)
#@events = Event.near([request.location.coordinates], 2)
#userLocation = params[:latitude], params[:longitude]
#@events = Event.near(userLocation,2)
#@json = (Event.near(userLocation,2)).to_gmaps4rails
#@events = Event.near(userLocation,2)
#@events = Event.near(params[:latitude], params[:longitude],2)
#@events = Event.scoped
#@events = Event.near('Patricks Street, Dublin 8, Ireland', 2)
#@events = Event.near(["53.3395715","-6.272263199999998"], 2)
#@events = @nearest.nearbys(30)
@events = Event.all
#render :stream => true

   
#@events = Event.search(params[:search])
#@events = Event.near(params[:yourLocation], 2)
@json = @events.to_gmaps4rails
#@json = Event.near(["53.3395715","-6.272263199999998"], 2).to_gmaps4rails
 # @center = yourLocation.to_gmaps4rails

   #@events = Event.order(:title)

   respond_to do |format|
      format.html # index.html.erb
      #format.js {render json: @events, content_type: 'text/json' }
      format.json { render :json => @json}
     # format.json { render :file => "index.json.erb", :content_type => 'application/json' }
    end
  end
  
    def home
  	#@events = Event.all
  	#userLocation = params[:latitude], params[:longitude]
    #@events = Event.near(userLocation,2)
  	@events = Event.near(["53.3395715","-6.272263199999998"], 2)
#@events = @nearest.nearbys(30)


   
 #@events = Event.search(params[:search])
#@events = Event.near(params[:yourLocation], 2)
@json = @events.to_gmaps4rails
 # @center = yourLocation.to_gmaps4rails

   #@events = Event.order(:title)

   respond_to do |format|
      format.html # index.html.erb
      #format.js {render json: @events, content_type: 'text/json' }
      format.json { render :json => @json }
    end
  end
  	
  	
    #@events = events.near(params[:yourLocation], 0.2, :order => :distance)
  	#else
    #	@locations = Location.all
  	#end
  	
	 # @json = @events.to_gmaps4rails

 #@events = Event.search(params[:search])
 # @json = @events.to_gmaps4rails
  


 
    #respond_to do |format|
    #  format.html # index.html.erb
      #format.json { render json: @events }
    #end
  #end
  

  

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    #@json = @events.to_gmaps4rails


    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
     if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end



end
