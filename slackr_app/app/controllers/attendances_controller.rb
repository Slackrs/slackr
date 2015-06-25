class AttendancesController < ApplicationController

	def show
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def edit
		@cohort = Cohort.find(params[:cohort_id])
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :users => {:cohort_id => params[:cohort_id]})
	end

	def update
		binding.pry
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

