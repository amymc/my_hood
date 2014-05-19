class UsersController < ApplicationController

#applying authorization using the CanCan gem
#ensures that only logged in users can access the edit/create pages
load_and_authorize_resource
	
  # GET /users
  # GET /users.json
  def index
 	@user = User.new(params[:user])
 	

    respond_to do |format|
      format.html # index.html.erb
      format.xml  {render :xml => @users}
    end
  end

#  def error
 # 	redirect_to root_url
 # end	

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
   @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  #create new user
  def create
    @user = User.new(params[:user])
	if @user.save
        redirect_to root_url, :notice => "Success! New user created"
    else
      render "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
	@user = User.new(params[:user])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  

end