class NotificationController < ApplicationController

	def new 
		students = Student.all
    @toubled_students = Student.troubled_array(students)
    @toubled_students.each do |s|
      NotificationMailer.alert_troubled_student(s).deliver_now
   	end
	end

end