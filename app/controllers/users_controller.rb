class UsersController < ApplicationController
  # has_secure_password
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
  end


def userJson
     respond_to do |format|
      User.all.each do |u|
        render :json => {:status => "ok",:username => u.name   ,:password => u.password}
      end
    end
end
  #return Json
  # def userJson
  #   respond_to do |format|
  #     @user.each do |u|
  #       render :json => {:status => ok,:username => u.username,:password => u.password}
  #     end
  #   end
  # end
  def show
    # @user = User.find(:params[:id])
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])        #get current user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
         flash[:success] = "Welcome to the Sample App!"
         format.html { redirect_to @user, notice: 'User was successfully created.' }
         format.json { render :show, status: :created, location: @user }
         # redirect_to @user
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        # render 'new'
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    # respond_to do |format|
    #   if @user.update_attributes(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to users_path
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password)
    end

end
