class ApplicationController < ActionController::Base
	include SessionHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	
  end

  def testJson
  	render :json => { :status => :ok, :message => "Success!", :html => "...insert html..." } 
  end

  def logout
	redirect_to root_path
  end


  private
   def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
