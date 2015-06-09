class VisitsController < ApplicationController
	def new
		@visit = Visit.new
		@doctors = User.all
	end

	def create
		@visit = Visit.create(visit_params)

		if @visit.save
			redirect_to @visit
		else
			render 'new'
		end
	end

	def show
		@visit = Visit.find(params[:id])
	end

	def index
		@visits = Visit.where(user_id: current_user.id)
	end

	def destroy
		@visit = Visit.find(params[:id])
		@visit.destroy
		@visits = Visit.where(user_id: current_user.id)

		#update_queue_positions(@visits)

		redirect_to visits_path
	end

	private
		def visit_params
			params.require(:visit).permit(:contact_number,:name,:age,:symptoms,:travel_time,:user_id)
		end
end