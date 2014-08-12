require 'rails_helper'

RSpec.describe Review, :type => :model do
  context 'validations' do
  	it 'requires a rating between 1 and 5' do
  		restaurant = Restaurant.create(name: "Whoop Burger", cuisine: "American")
  		review = restaurant.reviews.create(thoughts: "great", rating: 100)
  		expect(review).to have(1).error_on(:rating)
  	end
  end
end
