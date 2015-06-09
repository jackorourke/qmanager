class Patient < ActiveRecord::Base
	belongs_to :user

	#validates_uniqueness_of :contact_number
	validates :name, :contact_number, :date_of_birth, presence: true
end
