require "json"
require "open-uri"


api_key = 'd280a7d52f76658fb0585d14c353ba3b'
url = "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=5&api_key=#{api_key}"

def fetch_data_from_api(url, headers)
  open(url, headers) do |response|
    return response.read
  end
end

response = URI.open(url).read
movies = JSON.parse(response)["results"]


movies.each do |movie|
  Movie.create(
  title: movie["title"],
  overview: movie["overview"],
  poster_url: movie["poster_path"],
  rating: movie["vote_average"]
  )
  p "Create movie: #{movie["title"]}"
end


List.create(name: "Teste inicial")
