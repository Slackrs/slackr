class AttendancesController < ApplicationController

# 	before_action :set_cohort

# 	def new
# 	end

# 	def index
# 	end

# 	def edit
# 	end

# 	def show
# 		@attendances = Attendance.joins(:student).includes(:student).where(:date => params[:id], :students => {:cohort_id => @cohort.id}})
# 	end

# 	private

# 	def set_cohort
# 		@cohort = Cohort.find(params[:cohort_id])
# 	end
# end