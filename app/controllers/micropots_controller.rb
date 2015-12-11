class MicropotsController < ApplicationController
  include SessionHelper
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropot = current_user.micropots.build(micropot_params)
    if @micropot.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      # @feed_items = []              # why we need this
      render 'static_pages/home'
    end
  end

  def destroy
    @micropot.destroy
    flash[:success] = "Micropot deleted"
    redirect_to request.referrer || root_url
  end

  def update
      @micropot = Micropot.find(params[:id])
      object = Like_pros.new(:micropot_id =>@micropot, :user_id =>@current_user)
      object.save
      redirect_to @current_user
  end

  def show

  end


private
	def micropot_params
		params.require(:micropot).permit(:content)
	end 

  def correct_user
    @micropot = current_user.micropots.find_by(id: params[:id])
    redirect_to root_url if @micropot.nil?
  end

  def micropot_params
    params.require(:micropot).permit(:content, :picture)
  end

end
