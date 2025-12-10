require 'httparty'
require 'json'
require 'uri'

class ItunesService
  def self.search_by_genre(genre)
    # Encode le genre pour gérer les caractères spéciaux (accents, espaces, etc.)
    encoded_genre = URI.encode_www_form_component(genre)
    url = "https://itunes.apple.com/search?term=#{encoded_genre}&entity=song&limit=10&country=US"
    response = HTTParty.get(url)
    data = JSON.parse(response.parsed_response)  # Parser le JSON String
    return [] unless data.is_a?(Hash)

    songs = data["results"]

    songs.map do |song|
      {
        title: song["trackName"],
        artist: song["artistName"],
        preview_url: song["previewUrl"]
      }
    end
  end
end