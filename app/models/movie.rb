class Movie < ActiveRecord::Base
	has_many :videos
	has_many :gallery
	has_many :reviews
	has_many :rates

	has_many :movie_categories
	has_many :categories, :through => :movie_categories

	has_many :movie_genres
	has_many :genres, :through => :movie_genres

	has_many :movie_producers
	has_many :producers, :through => :movie_producers

	has_many :movie_actors
	has_many :actors, :through => :movie_actors

	has_many :favorite_movies
	has_many :users, :through => :favorite_movies

	def self.search(search) 
		where('name LIKE ?', "%#{search}%")
	end
	
end
