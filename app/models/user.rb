class User < ActiveRecord::Base
	has_many :micropots ,dependent: :destroy
	has_many :comment ,dependent: :destroy

	def feed
		micropots
	end

end
