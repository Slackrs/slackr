class NotificationsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def receive
		student = Student.find_by(phone_num: params[:From])
		message = params[:Body]
		process_message(message, student)
		if student.save
			notify(student)
		end
	end

	def get_todays_logs_batch_update
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		twilio_phone_number = ENV["TWILIO_PHONE_NUM"]
		message = client.account.messages.list({to: twilio_phone_number, DateSent: Date.today}).each do |message|
			message_body = message.body.split(" ")
			student = Student.find_by({phone_num: message.from})
			process_message(message_body, student)
			if student.save
				notify(student)
			end
			render nothing: true
		end
	end

	private

	def process_message(message, student)
		if message.select {|i| i == "late"}
			student.attendances.find_by(date: Date.today).late = true
		elsif message.select {|i| i == "absent"}
			student.attendances.find_by(date: Date.today).excused = true
		end
	end

	def notify(student)
		number_to_send_to = student.phone_num
		twilio_phone_number = ENV["TWILIO_PHONE_NUM"]
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		message = client.account.sms.messages.create(
			from: "#{twilio_phone_number}", 
			to: number_to_send_to, 
			body: 'Message received. Thanks for letting us know.'
			)
		render nothing: true
	end

	

end#TC