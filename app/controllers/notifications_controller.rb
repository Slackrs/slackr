class NotificationsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def receive
		phone_num = process_phone(params[:From])
		text_date = Date.today
		date = weekday_only(text_date)
		message = params[:Body].downcase
		student = Student.find_by(phone_num: phone_num)
		process_message(message, student, date)
		if student.save
			notify(student)
		end
	end

	private

#strip the "+1" off the front of the phone number to get it ready for matching
	def process_phone(number)
		phone_raw = number.split('')
		phone_raw.shift
		phone_raw.shift
		phone_num = phone_raw.join('')
	end

#if text is sent on a weekend, date is reset to the coming Monday
	def weekday_only(date)
		if date.saturday?
			date = date + 2
		elsif date.sunday?
			date = date + 1
		else
			date = date
		end
	end

#parse text body looking for absent or late keyword, updating student record accordingly
	def process_message(message, student, date)
		record = student.attendances.find_by(date: date)
		record.present = false
		record.absent = false
		if message.split(" ").select {|i| i == "late"}
			record.excused = false
			record.late = true
		elsif message.split(" ").select {|i| i == "absent"}
			record.late = false
			record.excused = true
		end
	end

#return text to student confirming receipt and updated record
	def notify(student)
		number_to_send_to = student.phone_num
		twilio_phone_number = Rails.application.secrets.twilio_phone_num
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		message = client.account.sms.messages.create(
			from: "#{twilio_phone_number}", 
			to: number_to_send_to, 
			body: "Hi #{student.name}. Message received. Thanks for letting us know."
			)
		render nothing: true
	end

###===== ANCILLARY BUT POSSIBLY USEFUL CODE ======###

#bulk update for all students based on their texts received in a given day
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
	
#call to Twilio API to get the date the text was sent
	def get_todays_date(messageSid)
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		log = client.account.messages.get(messageSid) ### would need to figure out what to pass the .get command to return the DateSent parameter
		date = weekday_only(Date.parse(log.DateSent)) 
	end

end#TC