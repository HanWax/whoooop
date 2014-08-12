require 'rails_helper'

RSpec.describe Review, :type => :model do
  context 'validations' do
  	it 'requires a rating' do
  		restaurant = Restaurant.create(name: "Whoop Burger", cuisine: "American")
  		restaurant.reviews.create(thoughts: "great")
  		expect(restaurant.reviews.count).to eq 0
  	end
  end
end
