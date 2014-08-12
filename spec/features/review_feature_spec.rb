require 'rails_helper'

describe 'reviews' do 

	before(:each) do 
		@restaurant = Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
	end 

	context 'no reviews added' do 
		it 'should display no reviews' do 
			visit '/restaurants'
			click_on("Write review")
			expect(page).to have_content("Enter review for Whoop Bar")
		end

		it 'can write a review' do
			visit '/restaurants'
			click_on("Write review")
			fill_in 'Thoughts', with: "Amazing"
			select '5', from: 'Rating'
			click_on 'Create Review'
			expect(page).to have_content("Amazing")
		end
	end

	context 'displaying reviews' do 
		it 'should display a restaurant with the average rating' do
			@restaurant.reviews.create(thoughts: "great", rating: 4)
			@restaurant.reviews.create(thoughts: "terrible", rating: 2)
			visit '/restaurants'
			expect(page).to have_content("Average rating: 3")
		end
	end 
end