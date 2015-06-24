class AttendancesController < ApplicationController

	def show
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => params[:cohort_id]})
	end

	def edit
		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => params[:cohort_id]})
	end

	private

end