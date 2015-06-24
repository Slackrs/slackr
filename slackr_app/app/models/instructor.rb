class Instructor < ActiveRecord::Base
	belongs_to :cohort
	has_many :students 

	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password

end