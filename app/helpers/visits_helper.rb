module VisitsHelper
	def estimate_wait_time(visits, visit)
		visits.index(visit) * 8
	end
end