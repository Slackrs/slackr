class AttendancesController < ApplicationController

	def show
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => params[:cohort_id]})
	end

	def edit
		@today = Attendance.find_by(date: Date.today)

		@cohort = Cohort.where(id: params[:cohort_id]).first.name
		@students = Student.where(cohort_id: params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => params[:cohort_id]})
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

