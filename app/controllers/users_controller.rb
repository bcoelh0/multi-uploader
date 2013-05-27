class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def check
    if @user = User.find_by_tumblr_name(auth_hash[:info][:nickname]) 
      session[:user_id] = @user.id
      redirect_to new_image_path
    else
      session[:blogs] = auth_hash[:info][:blogs]    
      session[:tumblr_name] = auth_hash[:info][:nickname]
      session[:auth] = auth_hash[:credentials]
      redirect_to new_user_path
    end
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.configure session[:auth]
    session[:auth] = nil
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.set session[:tumblr_name], session[:blogs]
    session[:tumblr_name] = nil
    session[:blogs] = nil

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to new_image_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render text: @user.errors}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :captation, :link, :tags)
    end

    def auth_hash
      request.env['omniauth.auth']
    end
end
