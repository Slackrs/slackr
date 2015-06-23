class Producer < ActiveRecord::Base
	has_many :cohorts
	validates :email, uniqueness: true
	# DHH <3's Coda
	has_secure_password
end