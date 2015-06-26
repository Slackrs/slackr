class AttendancesController < ApplicationController

	before_action :authorize

	def show
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def edit
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def update
		students = params[:students]
		students.each do |s|
			attendance = Attendance.where({student_id: s[0], date: params[:id]}).first
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

