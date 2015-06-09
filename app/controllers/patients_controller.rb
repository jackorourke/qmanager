class PatientsController < ApplicationController
	def new
		@patient = current_user.patients.build
	end

	def create
		@patient = current_user.patients.create(patient_params)
		if @patient.save
			redirect_to @patient
		else
			render 'new'
		end
	end

	def show
		@patient = Patient.find params[:id]
	end


private
	def patient_params
		params.require(:patient).permit(:name, :date_of_birth, :contact_number)	
	end

end