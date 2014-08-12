require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  context 'creating new entries' do
  	it 'should be able to create a new entry' do
  		Restaurant.create(name: "Whoop Burger", cuisine: "American")
  		expect(Restaurant.count).to eq 1
  	end

  	it 'should be able to edit an entry' do 
  		Restaurant.create(name: "Whoop Bar", cuisine: "Drinks")
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
    it 'will not save if the name is less than two characters' do 
      restaurant = Restaurant.create(name: 'Ab')
      expect(restaurant).to have(1).error_on(:name)
    end

    it 'will not save if the name is not capitalized' do
      restaurant = Restaurant.create(name: 'abc')
      expect(restaurant).to have(1).error_on(:name)
    end

    it 'cannot save if there is no cuisine' do 
      restaurant = Restaurant.create(name: "Whoop Burger")
      expect(restaurant).to have(1).error_on(:cuisine)
    end

    it 'cannot have duplicate restaurant entries' do 
      restaurant1 = Restaurant.create(name: "Whoop Burger", cuisine: 'American')
      restaurant2 = Restaurant.create(name: "Whoop Burger", cuisine: 'American')
      expect(Restaurant.count).to eq 1
    end 
  end 
end
