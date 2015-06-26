class User < ActiveRecord::Base
	validates :email, uniqueness: true
	has_secure_password

	def student?
		self.type == 'Student'
	end

	def instructor?
		self.type == 'Instructor'
	end

	def producer?
		self.type == 'Producer'
	end

end#U