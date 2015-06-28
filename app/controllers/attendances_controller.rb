class AttendancesController < ApplicationController
	before_action :authorize

	def index
		date = params[:date]
		# date_to_use = params[:date].to_s
		# datetime = DateTime.strptime(date_to_use, "%m/%d/%Y")
		# date = datetime.strftime("%Y-%m-%d") # reformat datetime and assign it to date
			# date = Date.parse(params[:date]).strftime("%d-%m-%Y")

		if current_user.instructor? 
  		redirect_to "/cohorts/#{@current_user.cohort_id}/attendances/#{date}/edit"
		elsif current_user.producer?
  		redirect_to "/cohorts/#{params[:cohort_id]}/attendances/#{date}" 
		end

	end
=begin
	clicking on go to date with no dates specified throws an error.
	invalid date has returned, needs rebase.
# wip
		# begin
  # 		specify the var and run the code that might throw an error
		#rescue ArgumentError #=> e
  		#flash[:error] = e.message # didn't add a message, KISS.
  		redirect_to "/cohorts/" + params[:cohort_id] + "/students"
=end
	def show
		current_user
		@cohort = Cohort.find(params[:cohort_id])
		@attendance = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
		@today = Date.today
		if @current_user.producer?  
			@cohort = Cohort.find(params[:cohort_id])
			@students = @cohort.students
		elsif @current_user.instructor?
			@cohort = Cohort.find(@current_user.cohort_id)
			@students = @cohort.students
		elsif @current_user.student?
			redirect_to cohort_stusdent_path(user.cohort_id, user.id)
		else
			redirect_to 'cohort'
		end
	end

	def edit
		# @today = Date.today
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def update
		students = params[:students]

		students.each do |s|

			student = Student.find(s[0])
			already_flagged = student.flagged?

			attendance = Attendance.where({student_id: s[0], date: params[:id]}).first
			attendance.present = (s[1][:presence] == 'present' ? true : false)
			attendance.late = (s[1][:presence] == 'late' ? true : false)
			attendance.absent = (s[1][:presence] == 'absent' ? true : false)
			attendance.excused = (s[1][:excused].nil? ? false : true)		
			attendance.save

			# if !already_flagged && student.flagged?
			if student.flagged?
				NotificationMailer.alert_troubled_student(s).deliver_now
			end
		end

		redirect_to "/cohorts/#{params[:cohort_id]}/attendances/#{params[:id]}/edit"
	end

# 	private

# 	def set_cohort
# 		@cohort = Cohort.find(params[:cohort_id])
# 	end
# end

end

