class Student < User
	belongs_to :cohort
	has_many :attendances
	has_many :instructors, through: :cohort

	def lates
		self.attendances.where({late: true, date: (self.cohort.start_date..Date.today)}).count
	end

	def absences
		self.attendances.where({absent: true, date: (self.cohort.start_date..Date.today)}).count
	end

	def excuseds
		self.attendances.where({excused: true, date: (self.cohort.start_date..Date.today)}).count
	end

	def presents
		self.attendances.where({present: true, date:
			(self.cohort.start_date..Date.today)}).count
	end

	def flagged?
		self.official_absences > 4
	end

	def official_absences
		self.absences + (self.lates/3)
	end

	def self.troubled
		self.all.select do |student|
			student.flagged?
		end
	end

	
end