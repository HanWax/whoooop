require 'rails_helper'

describe 'reviews' do 

	before(:each) do 
		@restaurant = Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
	end 

	context 'no reviews added' do 
		it 'should display no reviews' do 
			visit restaurants_path
			click_on("Write review")
			expect(page).to have_content("Enter review for Whoop Bar")
		end

		it 'can write a review' do
			leave_review("Cool", 4)
			expect(page).to have_content("Cool")
		end
	end

	context 'displaying reviews' do 
		it 'should display a restaurant with the average rating' do
			leave_review('Terrible', 1)
			leave_review('Average', 3)
		
			expect(page).to have_content("Average rating: ★★☆☆☆")
		end
	end 
end