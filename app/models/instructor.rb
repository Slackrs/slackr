class Instructor < User
	belongs_to :cohort

	has_many :students, through: :cohort


end