require 'rails_helper'

describe 'liking reviews' do 
	before do
		whoopbar = Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
		whoopbar.reviews.create(thoughts: "Awesome", rating: 5)
	end 

	it 'can like a review, updating the review\'s like count', js: true do 
		visit '/restaurants'
		click_link 'Whoop this review'
		expect(page).to have_content '1 whoop'
	end 
end