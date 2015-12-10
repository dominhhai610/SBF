class User < ActiveRecord::Base
	has_many :micropots ,dependent: :destroy

	def feed
		micropots
	end

end
