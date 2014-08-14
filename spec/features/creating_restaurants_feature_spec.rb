require 'rails_helper'

describe 'creating restaurants' do 

	context 'logged out' do 
		it 'should prompt the user to sign in' do 
			visit '/restaurants'
			click_link 'Add a restaurant'

			expect(page).to have_content 'Sign in'
		end 
	end 

	context 'logged in' do 
		before do
			hannah = User.create(email: "hannah@example.com", password: '12345678', password_confirmation: '12345678')
			login_as hannah
		end 
	end 

	context 'a valid restaurant' do 
		it 'prompts the user to fill out a form, then displays a new restaurant' do 
			visit '/restaurants'
			click_link 'Add a restaurant'

			fill_in 'restaurant[name]', with: "Whoop Sushi"
			fill_in 'restaurant[cuisine]', with: "Japanese"
			click_button 'Create Restaurant'

			expect(page).to have_content 'Whoop Sushi'
			expect(current_path).to eq '/restaurants'
		end 
	end 
end 