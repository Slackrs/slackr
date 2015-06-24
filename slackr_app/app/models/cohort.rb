class Cohort < ActiveRecord::Base
	
	belongs_to :producer
	has_many :instructors
	has_many :students

end