class ProducerMailer < ApplicationMailer
	def send_email(student, producer, message)
		@message = message
		
		mail({to: producer.email, from: student.email, subject:'hi', message: message})		
	end
end
