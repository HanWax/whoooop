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

  context 'ratings' do
    it 'knows its ratings average' do 
      restaurant = Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
      restaurant.reviews.create(thoughts: "The best bar in town", rating: 5)
      restaurant.reviews.create(thoughts: "Second to none", rating: 3)
      expect(restaurant.average_rating).to eq(4)
    end  
  end

  context 'validations' do 
    it 'cannot save if there is no name' do 
      restaurant = Restaurant.create(cuisine: "Japanese")
      expect(Restaurant.count).to eq 0
    end
  end 
end
