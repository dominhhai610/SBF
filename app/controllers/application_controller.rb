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

end
