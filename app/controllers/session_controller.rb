class SessionController < ApplicationController
  include SessionHelper
  def new
  end

  def create
  	# render 'new'
  	user = User.find_by(name: params[:session][:userName],password: params[:session][:password])
  	if user 
  		# && user.authenticate(params[:session][:password])
  		flash[:sucess] = 'login sucess' # Not quite right!
      log_in user
      redirect_to user
  		# redirect_to root_path
  		# redirect_to user_path`
  	else
  		flash[:danger] = 'Invalid email/password combination' # Not quite right!
      	render 'new'
  	end
  end

  def  destroy
  	log_out
    redirect_to root_path
  end


end
