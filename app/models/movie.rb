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

end
