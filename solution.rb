class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
    Rating.new(self, score, movie)
  end

  def ratings
    Rating.all.select {|rating| rating.viewer == self}
  end

  def rating(movie)
    ratings.find {|rating| rating.movie == movie}
  end

  def movies
    ratings.map {|rating| rating.movie}
  end

  def update_rating(movie, score)
    movie_rating = rating(movie)
    movie_rating.score = score
    movie_rating
  end

  def remove_rating(movie)
    Rating.all.delete_if {|rating| rating == self.rating(movie)}
    movie
  end
end

class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize(viewer, score, movie)
    @viewer, @score, @movie = viewer, score, movie
    @@all << self
  end

  def self.all
    @@all
  end

end

class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find {|movie| movie.title == title}
  end

  def ratings
    Rating.all.select {|rating| rating.movie == self}
  end

  def viewers
    ratings.map {|rating| rating.viewer}
  end

  def average_rating
    avg_rating = ratings.inject(0) {|sum, rating| sum + rating.score} / ratings.count
    avg_rating.round(1)
  end

  def self.highest_rated
    Movie.all.max_by {|movie| movie.average_rating}
  end

end
