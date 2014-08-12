class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true

	def average_rating
		return calculate_average_rating.round(1) if has_average?
		"No ratings yet"
	end

	private
	def calculate_average_rating
		self.reviews.map { |e| e.rating }.inject(:+).to_f / self.reviews.length
	end

	def has_average?
		!calculate_average_rating.nan?
	end
end
