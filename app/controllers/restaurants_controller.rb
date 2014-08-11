class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
	end 

	def create
		@restaurant = Restaurant.new(name: params[:restaurant][:name], cuisine: params[:restaurant][:cuisine])
		if @restaurant.save
			redirect_to '/restaurants'
		else
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])

	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(name: params[:restaurant][:name], cuisine: params[:restaurant][:cuisine])
		redirect_to '/restaurants'
	end
end
