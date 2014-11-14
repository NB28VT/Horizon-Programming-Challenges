require 'pry'
require "json"
require "net/http"

if !ENV.has_key?("ROTTEN_TOMATOES_API_KEY")
  puts "You need to set the ROTTEN_TOMATOES_API_KEY environment variable."
  exit 1
end

api_key = ENV["ROTTEN_TOMATOES_API_KEY"]
uri = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=#{api_key}")

response = Net::HTTP.get(uri)
movie_data = JSON.parse(response)


average_hash ={}





movie_data["movies"].each do |movie|
  title = movie["title"]
  rating = movie["mpaa_rating"]

  critics_score = movie["ratings"]["critics_score"]
  audience_score = movie["ratings"]["audience_score"]
  score_average = (critics_score + audience_score) / 2

  cast_list = []

  cycle_count = 0

  until cycle_count == 3
    # Check if actor exists in cast
    unless movie["abridged_cast"][cycle_count] == nil
      cast_list << movie["abridged_cast"][cycle_count]["name"]
    end
    cycle_count += 1
  end

average_hash[score_average] = "#{score_average} - #{title} (#{rating}) starring #{cast_list.join(', ')}"

end

average_hash = average_hash.sort_by { |word, count| count }.reverse
average_hash.each do |average, info|
  puts info
end
