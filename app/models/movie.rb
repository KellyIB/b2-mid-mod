class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :studio

  has_many :movie_actors
  has_many :actors, through: :movie_actors



  def movie_actor_sort(movie)
    movie.actors.order(age: :desc)
  end

  def actors_ave_age(movie)
    movie.actors.average(:age)
  end
end
