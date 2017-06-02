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
