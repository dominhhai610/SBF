class LikeProsController < ApplicationController

	# GET /users
  # GET /users.json
  def index
    @Like_pros = Like_pros.all
    
  end



  def update
      @micropot = Micropot.find(params[:id])
      @current_user = User.find(params[:current_user])
      @refer_user = User.find(params[:refer_user])
    if(params[:is_like] == "1")
      object = LikePro.new(:micropot_id => @micropot.id, :user_id => @current_user.id)
      object.save
      redirect_to @refer_user
    else
      LikePro.where(micropot_id: @micropot.id, user_id: @current_user.id).destroy_all
      redirect_to @refer_user
    end
    
  end

end
