class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end 

	def create
		@restaurant = Restaurant.create(params[:restaurant].permit(:name, :cuisine))
		flash[:notice] = "Restaurant created"
		redirect_to '/restaurants'
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name, :cuisine))
		redirect_to '/restaurants'
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		flash[:notice] = "Deleted"
		redirect_to '/restaurants'
	end 
end
