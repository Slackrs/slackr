class AttendancesController < ApplicationController

	def index	
		date = Date.parse(params[:date]).strftime("%d %m %Y")
		redirect_to "/cohorts/" + params[:cohort_id]+ "/attendances/" + date
	end

	def show
		current_user
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
		@today = Date.today
		if @current_user.producer?  
			@cohort = Cohort.find(params[:cohort_id])
			@students = @cohort.students
		elsif @current_user.instructor?
			@cohort = Cohort.find(@current_user.cohort_id)
			@students = @cohort.students
		elsif @current_user.student?
			redirect_to cohort_student_path(user.cohort_id, user.id)
		else
			redirect_to 'cohort'
		end
	end

	def edit
		# binding.pry
		# @today = Date.today
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def update
		students = params[:students]

		students.each do |s|
			attendance = Attendance.where({student_id: s[0], id: params[:id]}).first
			attendance.present = (s[1][:present].nil? ? false : true)
			attendance.late = (s[1][:late].nil? ? false : true)
			attendance.absent = (s[1][:absent].nil? ? false : true)
			attendance.excused = (s[1][:excused].nil? ? false : true)		
			attendance.save
		end
		redirect_to "/cohorts/#{params[:cohort_id]}/attendances/#{params[:id]}"
	end

	private

	

# 	def show
# 		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => @cohort.id}})
# 	end

# 	private

# 	def set_cohort
# 		@cohort = Cohort.find(params[:cohort_id])
# 	end
# end

end

