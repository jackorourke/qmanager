class PatientsController < ApplicationController
	def new
		@patient = current_user.patients.build
	end

	def create
		@patient = Patient.where(contact_number: patient_params[:contact_number]).first_or_initialize
		if @patient.new_record?
			@patient.assign_attributes(patient_params)
		end

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

	def find_patient
		
	end


private
	def patient_params
		params.require(:patient).permit(:name, :date_of_birth, :contact_number)	
	end

end