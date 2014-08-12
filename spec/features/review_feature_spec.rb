require 'rails_helper'

describe 'reviews' do 

	before(:each) do 
		Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
	end 

	context 'no reviews added' do 
		it 'should display no reviews' do 
<<<<<<< HEAD
			restaurant = Restaurant.find_by(name: "Whoop Bar")
=======
>>>>>>> development
			visit '/restaurants'
			click_on("Write review")
			expect(page).to have_content("Enter review for Whoop Bar")
		end
<<<<<<< HEAD
	end 
=======

		it 'can write a review' do
			visit '/restaurants'
			click_on("Write review")
			fill_in 'Thoughts', with: "Amazing"
			select '5', from: 'Rating'
			click_on 'Create Review'
			expect(page).to have_content("Amazing")
		end
	end
>>>>>>> development
 	
end