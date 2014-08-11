require 'rails_helper'

describe 'reviews' do 

	before(:each) do 
		Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
	end 

	context 'no reviews added' do 
		it 'should display no reviews' do 
			restaurant = Restaurant.find_by(name: "Whoop Bar")
			visit '/restaurants'
			click_on("Write review")
			expect(page).to have_content("Enter review for Whoop Bar")
		end
	end 
 	
end