class Cohort < ActiveRecord::Base
	
	belongs_to :producer
	has_many :instructors, :students


end