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
    {playlist: playlist_punk, title: "Basket Case",               artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/NUTGr5t3MoY?si=1c7iinecHj4k_wGy"}
    {playlist: playlist_punk, title: "All the Small Things",      artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/9Ht5RZpzPqw?si=pM9YxDOIr1j5IiV1"}
    {playlist: playlist_punk, title: "Self Esteem",               artist: "The Offspring",       youtube_url: "https://www.youtube.com/embed/kkcbxjWG9Mc?si=lI2iYq9Eh3fPo5hG"}
    {playlist: playlist_punk, title: "American Idiot",            artist: "Green Day",           youtube_url: "https://www.youtube.com/embed/Ee_uujKuJMI?si=o3vgBxdLnNxH2-4_"}
    {playlist: playlist_punk, title: "What's My Age Again?",      artist: "blink-182",           youtube_url: "https://www.youtube.com/embed/k1BFHYtZlAU?si=o3kF0zGsNM_e6ppV"}
    {playlist: playlist_punk, title: "Linoleum",                  artist: "NOFX",                youtube_url: "https://www.youtube.com/embed/d9ORimXBXLw?si=Wl-ZU0UnNv3ow013"}
    {playlist: playlist_punk, title: "Time Bomb",                 artist: "Rancid",              youtube_url: "https://www.youtube.com/embed/LxaA9_mzOz4?si=Yb5ZDK3H9dxdB4E0"}
    {playlist: playlist_punk, title: "Anarchy in the U.K.",       artist: "Sex Pistols",         youtube_url: "https://www.youtube.com/embed/qbmWs6Jf5dc?si=2q6_4VtY4UsKxZAb"}
    {playlist: playlist_punk, title: "Blitzkrieg Bop",            artist: "Ramones",             youtube_url: "https://www.youtube.com/embed/NQDPx_k66w4?si=HsbkmnAR26-ax4sN"}
    {playlist: playlist_punk, title: "London Calling",            artist: "The Clash",           youtube_url: "https://www.youtube.com/embed/LC2WpBcdM_A?si=VO9dGZwWh_qrR2SJ"}
  ]
)
test = Song.where(playlist: playlist_punk)
puts "#{test.size} punk songs created"

Song.create!(
  [
    {playlist: playlist_classic, title: "Moonlight Sonata (1st Movement)", artist: "Ludwig van Beethoven", youtube_url: "https://www.youtube.com/embed/4Tr0otuiQuU"}
    {playlist: playlist_classic, title: "Clair de Lune",                    artist: "Claude Debussy",        youtube_url: "https://www.youtube.com/embed/CvFH_6DNRCY"}
    {playlist: playlist_classic, title: "Swan Lake – Theme",               artist: "Pyotr Ilyich Tchaikovsky", youtube_url: "https://www.youtube.com/embed/9cNQFB0TDfY"}
    {playlist: playlist_classic, title: "Ride of the Valkyries",           artist: "Richard Wagner",        youtube_url: "https://www.youtube.com/embed/V92OBNsQgxU"}
    {playlist: playlist_classic, title: "Canon in D",                      artist: "Johann Pachelbel",      youtube_url: "https://www.youtube.com/embed/NlprozGcs80"}
    {playlist: playlist_classic, title: "Nocturne Op. 9 No. 2",            artist: "Frédéric Chopin",       youtube_url: "https://www.youtube.com/embed/9E6b3swbnWg"}
    {playlist: playlist_classic, title: "The Four Seasons – Spring",       artist: "Antonio Vivaldi",       youtube_url: "https://www.youtube.com/embed/mFWQgxXM_b8"}
    {playlist: playlist_classic, title: "Boléro",                          artist: "Maurice Ravel",         youtube_url: "https://www.youtube.com/embed/r30D3SW4OVw"}
    {playlist: playlist_classic, title: "Hungarian Dance No. 5",           artist: "Johannes Brahms",       youtube_url: "https://www.youtube.com/embed/3X9LvC9WkkQ"}
    {playlist: playlist_classic, title: "Symphony No. 40 (1st Movement)",  artist: "Wolfgang Amadeus Mozart", youtube_url: "https://www.youtube.com/embed/TK_6jOZix2k"}
  ]
)
puts "#{Song.playlist == playlist_classical} classical songs created"



puts "success"
  # create_table "playlists", force: :cascade do |t|
  #   t.string "visibility"
  #   t.string "title"
  #   t.string "badge"
  #   t.bigint "user_id", null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["user_id"], name: "index_playlists_on_user_id"
  # end
