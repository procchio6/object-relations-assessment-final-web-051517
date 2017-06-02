require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

movie = Movie.new("Wonder Women")
pat = Viewer.new("Pat")
yomi = Viewer.new("Yomi")
niky = Viewer.new("Niky")
pat.create_rating(10.0, movie)
yomi.create_rating(8.0, movie)
niky.create_rating(9.0, movie)

Pry.start
