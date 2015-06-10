class VisitsController < ApplicationController
	include VisitsHelper
	def new
		@visit = Visit.new
		@doctors = User.all
	end

	def create
		@visit = Visit.create(visit_params)

		if @visit.save
			@visits = Visit.where(user_id: @visit.user_id).order(created_at: :asc)
			estimate_wait_time(@visits, @visit)		#MUST WRITE THIS METHOD
			#send_confirm_sms
			redirect_to @visit
		else
			render 'new'
		end
	end

	def show
		@visit = Visit.find(params[:id])

		@visits = Visit.where(user_id: @visit.user_id).order(created_at: :asc)
		@wait_time = estimate_wait_time(@visits, @visit)
	end

	def index
		@visits = Visit.where(user_id: current_user.id).order(created_at: :asc)
	end

	def destroy
		@visit = Visit.find(params[:id])
		@visit.destroy
		@visits = Visit.where(user_id: current_user.id)

		redirect_to visits_path
	end

	def search
		@searched = false
		if params[:search] && params[:search] != ""
			@visits = Visit.search(params[:search]).order("created_at DESC")
			@searched = true
			render 'search'
		end
	end


	private
		def visit_params
			params.require(:visit).permit(:contact_number,:name,:age,:symptoms,:travel_time,:user_id)
		end
end