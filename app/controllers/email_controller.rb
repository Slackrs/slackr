class EmailController <ApplicationController
	def create
		student = Student.find current_user
		cohort = student.cohort
		producer = Producer.find cohort.producer_id
		message = params['message'] #form with attr named message
		subject = params['subject']
		ProducerMailer.send_email(student, producer, message, subject).deliver_now
		redirect_to '/'
	end
end