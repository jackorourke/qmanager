module VisitsHelper
	def estimate_wait_time(visits, visit)
		visits.index(visit) * 8
	end

	#Send a confirmatory text when a patient creates a visit
	def notify(number, name, doctor_name, time)
		account_sid = 'AC0f7b2e3b01c8a0a5403793f47886a449'
		auth_token = 'a8ee6497354061ab6d3f96160e36f1ff'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		# alternatively, you can preconfigure the client like so
		Twilio.configure do |config|
  			config.account_sid = account_sid
  			config.auth_token = auth_token
		end

		# and then you can create a new client without parameters
		@client = Twilio::REST::Client.new

		@client.messages.create(
  			from: '+12515806653',
  			to: "#{number}",
  			body: "#{name}, you have successfully been added to the queue for Dr. #{doctor_name}. Estimated wait time: #{time} minutes"
		)
	end

	def check_for_reminder(visits)
		visits.each do |visit|
			travel = visit.travel_time + 8
			wait = estimate_wait_time(visits, visit)

			if  wait <= travel
				remind(visit)
			end
		end
	end
	#Send a text when the patient should come to the doctor
	def remind(visit)
		account_sid = 'AC0f7b2e3b01c8a0a5403793f47886a449'
		auth_token = 'a8ee6497354061ab6d3f96160e36f1ff'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		# alternatively, you can preconfigure the client like so
		Twilio.configure do |config|
  			config.account_sid = account_sid
  			config.auth_token = auth_token
		end

		# and then you can create a new client without parameters
		@client = Twilio::REST::Client.new

		@client.messages.create(
  			from: '+12515806653',
  			to: "#{visit.contact_number}",
  			body: "#{visit.name}, it is time for you to head to your appointment with Dr. #{visit.user.name}."
		)
	end
end


