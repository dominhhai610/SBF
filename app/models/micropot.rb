class Micropot < ActiveRecord::Base
  belongs_to :user
  has_many :like_pro
  has_many :comment ,dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  mount_uploader :picture , PictureUploader


  def alllike
  	like_pro
  end



  def checkliked(user_id,micropot_id)
  	@micropot = Micropot.find_by(:id => micropot_id)
 	@is_like = @micropot.like_pro.find_by(:user_id => user_id)
  	# @micropot = Micropot.find_by(:user_id => user_id)
  	return @is_like.nil?
  end

end
