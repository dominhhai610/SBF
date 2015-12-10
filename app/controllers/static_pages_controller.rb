class StaticPagesController < ApplicationController
  include SessionHelper
  def home
  	if logged_in?
  	 @micropot = current_user.micropots.build if logged_in?
  	 @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def login
  end

end
