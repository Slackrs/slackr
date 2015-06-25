class AttendancesController < ApplicationController

	def show
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => params[:cohort_id]})
	end

	def edit
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

