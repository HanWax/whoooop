require 'rails_helper'

describe 'restaurants' do 
	context 'no restaurants added' do 
		it 'should display no restaurants' do 
			visit '/restaurants'
			expect(page).to have_content("No restaurants available")
			expect(page).to have_link("Add restaurant")
		end 

		it 'can go to new restaurant page' do 
			visit '/restaurants'
			click_on "Add restaurant"
			expect(page).to have_content("Enter a new restaurant")
		end 

		it 'can add a new restaurant' do
			visit '/restaurants/new'
			
			fill_in 'restaurant[name]', with: "Whoop Sushi"
			fill_in 'restaurant[cuisine]', with: "Japanese"
			click_on 'Add'
			expect(page).to have_content("Whoop Sushi")
			expect(page).to have_content("Japanese")
		end
	end

	context 'with resturants' do
		before do
			Restaurant.create(name: "Whoop Burgers")
		end

		it 'should display restaurants' do
			visit '/restaurants'
			expect(page).to have_content("Whoop Burgers")
		end

		it 'should dispaly edit restaurant form' do 
			visit '/restaurants'
			click_on("Edit")
			expect(page).to have_content("Edit restaurant")
		end

		it 'should be able to edit a restaurant' do 
			restaurant = Restaurant.find_by(name: "Whoop Burgers")
			visit "/restaurants/#{restaurant.id}/edit"
			fill_in 'restaurant[name]', with: "Whoop Sushi"
			fill_in 'restaurant[cuisine]', with: "Japanese"
		end
	end


end