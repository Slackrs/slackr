class ProducerMailer < ApplicationMailer
	def send_email(student, producer, message, subject)
		@message = message
		@email = student.email
		mail({to: producer.email, from: student.email, subject: subject, message: message})		
	end
end
