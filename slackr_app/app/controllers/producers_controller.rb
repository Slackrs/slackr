class ProducersController < ApplicationController

	def new
	end

	def show
		@producer = Producer.find(params['id'])
	end

	def edit
	end

end