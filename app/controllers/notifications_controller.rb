require 'twilio-ruby'

class NotificationsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def receive
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		message = client.account.messages.get(
			to: "#{twilio_phone_num}",
			DateSent: Date.today,
			)
		render nothing: true

		message_body = params["Body"].split(" ")
		from = params["From"]
		student = Student.find_by({phone_num: from})

		if message_body.select {|i| i == "late"}
			student.attendances.find_by(date: Date.today).late = true
		elsif message_body.select {|i| i == "absent"}
			student.attendances.find_by(date: Date.today).excused = true
		end
		if student.save
			redirect_to "/notifications/notify/#{student.id}"
		end
	end

	def notify
		number_to_send_to = Instructor.find(params[:id]).phone_num
		twilio_phone_number = ENV["TWILIO_PHONE_NUM"]

		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		message = client.messages.create(
			from: "#{twilio_phone_number}", 
			to: number_to_send_to, 
			body: 'Message received. Thanks for letting us know.'
			)
		render nothing: true
	end

	

end#TC