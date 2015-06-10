class Visit < ActiveRecord::Base
	belongs_to :user

	before_create :set_time_to_now
	def set_time_to_now
    	self.time = Time.now
  	end

  	#def update_queue_positions(visits)
  	#	visits.each do |visit|
  	#		visit.position = visit.position - 1 
  	#	end
  	#end
end