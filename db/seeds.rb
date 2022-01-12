count = Movie.count
url = "http://tmdb.lewagon.com/movie/top_rated?page="

for page in 1..5
  JSON.parse(URI.open("#{url}#{page}").read)['results'].each do |movie|
    movie = Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: movie["poster_path"],
      rating: movie["vote_average"]
    )
    movie.save
  end
end

puts "Finished! #{Movie.count - count} movies added, #{Movie.count} movies total in database."
