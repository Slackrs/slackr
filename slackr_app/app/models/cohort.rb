class Cohort < ActiveRecord::Base
	
	belongs_to :producers
	has_many :instructors, :students


end