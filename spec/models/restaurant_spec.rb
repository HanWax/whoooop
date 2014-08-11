require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  context 'creating new entries' do
  	it 'should be able to create a new entry' do
  		Restaurant.create(name: "Whoop Burger")
  		expect(Restaurant.count).to eq 1
  	end

  	it 'should be able to edit an entry' do 
  		Restaurant.create(name: "Whoop Bar")
  		restaurant = Restaurant.find_by(name: "Whoop Bar")
  		restaurant.update(name: "Whoop Sushi")
  		expect(restaurant.name).to eq("Whoop Sushi")
  	end 
  end
end
