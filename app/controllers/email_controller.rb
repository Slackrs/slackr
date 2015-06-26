class EmailController <ApplicationController
	def create
		student = Student.find session[:student_id] 
		producer = Producer.find params['producer_id']
		message = params['message'] #form with attr named message
		ProducerMailer.send_email(student, producer, message).deliver_now
	end
end