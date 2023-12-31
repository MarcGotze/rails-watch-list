# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'net/http'
require 'json'

Movie.destroy_all
URL = "https://tmdb.lewagon.com/movie/top_rated"
uri = URI(URL)
response = Net::HTTP.get(uri)
data = JSON.parse(response)['results']

puts "Creating movies..."
puts "========================================"
data.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
  puts movie['title']
end
puts "========================================"
puts "Completed !!"
