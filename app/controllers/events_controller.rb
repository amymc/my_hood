class EventsController < ApplicationController
# before_filter :authorize, :only => [:edit, :new]

  #GET /events
  #GET /events.json
  def index
 
  #@search = Event.search(params[:search])  
 # @events = @search.all  
 @events = Event.near('Dublin, Ireland', 20)


#if User.find(current_user)
 #   @user = User.find(current_user)
 #   @locations = Location.near(params[:latitude => @user.latitude, :longitude => @user.longitude], 50, :order => :distance)
 # end
   
 # @events = Event.search(params[:search])
  @json = @events.to_gmaps4rails
 # @center = yourLocation.to_gmaps4rails

   #@events = Event.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end
  
    def home
  	#@events = Event.all
  	
  	
    @events = events.near(params[:yourLocation], 0.2, :order => :distance)
  	#else
    #	@locations = Location.all
  	#end
  	
	 # @json = @events.to_gmaps4rails

 @events = Event.search(params[:search])
  @json = @events.to_gmaps4rails
  


 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
   def find_closest
	@userLocation = MultiGeocoder.geocode(params[:userLocation])
	if @userLocation.success
	@events = Event.find(:all,
		:origin => [@userLocation.lat, @userLocation.lng],
		:conditions => ["distance < 0.5", params[:radius]],
		:order=>'distance')
		#@map = gmap4rails.new
    end
  end
  

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
  
  protected
  
  def authorize
   unless User.find_by_id(session[:user_id])
   	redirect_to events_url, :notice => "access denied"
   end	
  end 


end
