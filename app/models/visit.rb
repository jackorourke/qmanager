class Visit < ActiveRecord::Base
	belongs_to :user

	before_create :set_time_to_now
	def set_time_to_now
    	self.time = Time.now
  	end
  	

end