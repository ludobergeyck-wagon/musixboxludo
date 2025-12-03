# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
UserSession.destroy_all
Session.destroy_all
Song.destroy_all
Playlist.destroy_all
User.destroy_all
puts "Création de l'utilisateur Admin de test..."
user = User.create!(
  email: "adil@adil.com",
  password: "password",
  pseudo: "testAdmin"
)
    # MIKE
    playlist_rock = Playlist.create!({title:"Rock", user: user})
    playlist_jazz = Playlist.create!({title:"Jazz", user: user})
    playlist_pop = Playlist.create!({title:"Pop", user: user})
    # LUDO
    playlist_rnb = Playlist.create!({title:"R'n'b", user: user})
    playlist_blues = Playlist.create!({title:"Blues", user: user})
    playlist_hiphop = Playlist.create!({title:"Hip Hop", user: user})
    # ADIL
    playlist_soul = Playlist.create!({title:"Soul", user: user})
    playlist_funk = Playlist.create!({title:"Funk", user: user})
    playlist_disco = Playlist.create!({title:"disco", user: user})
    # AXEL
    playlist_classic = Playlist.create!({title:"Classic", user: user})
    playlist_punk = Playlist.create!({title:"Punk", user: user})
    playlist_world = Playlist.create!({title:"World", user: user})
Song.create!(
  [
  {playlist: playlist_rock, title: "Hardest button to button", artist: "the white stripes", youtube_url: "https://www.youtube.com/embed/K4dx42YzQCE?si=LbXTI9nJnt6mAj70"}
  ]
)
puts "success"


[
  {playlist: playlist_soul, title: "Respect", artist: "Aretha Franklin", youtube_url: "https://www.youtube.com/embed/6FOUqQt3Kg0"},
  {playlist: playlist_soul, title: "What's Going On", artist: "Marvin Gaye", youtube_url: "https://www.youtube.com/embed/H-kA3UtBj4M"},
  {playlist: playlist_soul, title: "Stand By Me", artist: "Ben E. King", youtube_url: "https://www.youtube.com/embed/hwZNL7QVJjE"},
  {playlist: playlist_soul, title: "My Girl", artist: "The Temptations", youtube_url: "https://www.youtube.com/embed/eepLY8J4E6c?si=YehHNlrcf4tkCtSO"},
  {playlist: playlist_soul, title: "When a Man Loves a Woman", artist: "Percy Sledge", youtube_url: "https://www.youtube.com/embed/EYb84BDMbi0?si=hJf9JzRg9MWO40tD"},
  {playlist: playlist_soul, title: "Say It Loud - I'm Black and I'm Proud", artist: "James Brown", youtube_url: "https://www.youtube.com/embed/4hj1iWqoYEc?si=foJsob97v1fj1-xZ"},
  {playlist: playlist_soul, title: "Sittin' On The Dock Of The Bay", artist: "Otis Redding", youtube_url: "https://www.youtube.com/embed/rTVjnBo96Ug"},
  {playlist: playlist_soul, title: "Fallin'", artist: "Alicia Keys", youtube_url: "https://www.youtube.com/embed/Urdlvw0SSEc?si=Qs6-dC9NKqIJ5hmn"},
  {playlist: playlist_soul, title: "The Thrill Is Gone", artist: "B.B. King", youtube_url: "https://www.youtube.com/embed/4fk2prKnYnI"},
  {playlist: playlist_soul, title: "(Sittin' On) The Dock of the Bay", artist: "Otis Redding", youtube_url: "https://www.youtube.com/embed/rTVjnBo96Ug"}
]


[
  {playlist: playlist_funk, title: "Super Freak", artist: "Rick James", youtube_url: "https://www.youtube.com/embed/QYHxGBH6o4M"},
  {playlist: playlist_funk, title: "Give Up The Funk", artist: "Parliament", youtube_url: "https://www.youtube.com/embed/u-6cvgbITL0"},
  {playlist: playlist_funk, title: "Brick House", artist: "Commodores", youtube_url: "https://www.youtube.com/embed/q_rGfOZRNTg"},
  {playlist: playlist_funk, title: "Play That Funky Music", artist: "Wild Cherry", youtube_url: "https://www.youtube.com/embed/hcuM0ZRRmEM"},
  {playlist: playlist_funk, title: "Get Up (I Feel Like Being a) Sex Machine", artist: "James Brown", youtube_url: "https://www.youtube.com/embed/sjzZh6-h9fM"},
  {playlist: playlist_funk, title: "Flash Light", artist: "Parliament", youtube_url: "https://www.youtube.com/embed/7ZgOo__4eC8"},
  {playlist: playlist_funk, title: "Jungle Boogie", artist: "Kool & The Gang", youtube_url: "https://www.youtube.com/embed/p1SLTRKSiyg"},
  {playlist: playlist_funk, title: "Fire", artist: "Ohio Players", youtube_url: "https://www.youtube.com/embed/hCuloYf-HHE"},
  {playlist: playlist_funk, title: "Love Rollercoaster", artist: "Ohio Players", youtube_url: "https://www.youtube.com/embed/G1eF0wICJ6k"},
  {playlist: playlist_funk, title: "Tell Me Something Good", artist: "Rufus & Chaka Khan", youtube_url: "https://www.youtube.com/embed/caBQhM1Pgzw"}
]

[
  {playlist: playlist_disco, title: "Stayin' Alive", artist: "Bee Gees", youtube_url: "https://www.youtube.com/embed/I_izvAbhExY"},
  {playlist: playlist_disco, title: "Le Freak", artist: "Chic", youtube_url: "https://www.youtube.com/embed/aQF9Gr4dQY0"},
  {playlist: playlist_disco, title: "I Will Survive", artist: "Gloria Gaynor", youtube_url: "https://www.youtube.com/embed/ARt9HVvKJHw"},
  {playlist: playlist_disco, title: "Dancing Queen", artist: "ABBA", youtube_url: "https://www.youtube.com/embed/xFrGuyw1V8s"},
  {playlist: playlist_disco, title: "Don't Leave Me This Way", artist: "Thelma Houston", youtube_url: "https://www.youtube.com/embed/8sAbzZjXLy8?si=zKcOCO-SgHldhxP-"},
  {playlist: playlist_disco, title: "YMCA", artist: "Village People", youtube_url: "https://www.youtube.com/embed/CS9OO0S5w2k"},
  {playlist: playlist_disco, title: "Boogie Wonderland", artist: "Earth, Wind & Fire", youtube_url: "https://www.youtube.com/embed/god7hAPv8f0"},
  {playlist: playlist_disco, title: "He's the Greatest Dancer", artist: "Sister Sledge", youtube_url: "https://www.youtube.com/embed/fLLSwHaYk6k?si=ThdtmaQuTslHzUDu"},
  {playlist: playlist_disco, title: "Hot Stuff", artist: "Donna Summer", youtube_url: "https://www.youtube.com/embed/KhcaPNuaJNU?si=ZEP8mgeYgbvsPkH7"},
  {playlist: playlist_disco, title: "Funky Town", artist: "Lipps Inc.", youtube_url: "https://www.youtube.com/embed/uhzy7JaU2Zc?si=eHukqeeIzaHLUc_Q"}
]
