class Student < ActiveRecord::Base
	has_many :attendances
	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password
end