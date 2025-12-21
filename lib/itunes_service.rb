# app/services/itunes_service.rb
require 'httparty'
require 'json'
require 'uri'

class ItunesService
  def self.search_by_genre(genre, year_range: nil)
    encoded_genre = URI.encode_www_form_component(genre)
    offset = rand(0..50)
    
    url = "https://itunes.apple.com/search?term=#{encoded_genre}&entity=song&limit=200&offset=#{offset}&country=US"
    response = HTTParty.get(url)
    data = JSON.parse(response.parsed_response)
    return [] unless data.is_a?(Hash)

    songs = data["results"]
    
    # Filtrer par année si demandé
    if year_range
      songs = songs.select do |song|
        next false unless song["releaseDate"]
        year = song["releaseDate"][0..3].to_i
        year_range.include?(year)
      end
    end

    songs.shuffle.take(20).map do |song|
      {
        title: song["trackName"],
        artist: song["artistName"],
        preview_url: song["previewUrl"],
        year: song["releaseDate"]&.slice(0, 4)
      }
    end
  end
end