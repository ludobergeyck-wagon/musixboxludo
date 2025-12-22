
UserSession.destroy_all
Question.destroy_all
Session.destroy_all
Song.destroy_all
Playlist.destroy_all
User.destroy_all



user = User.create!(
  email: "adil@adil.com",
  password: "password",
  pseudo: "testAdmin"
)




playlist_hiphop = Playlist.create!({title:"Hip Hop", user: user})
songs_data = ItunesService.search_by_genre("hip hop")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_hiphop, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_electronic = Playlist.create!({title:"Electronic", user: user})
songs_data = ItunesService.search_by_genre("electronic")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_electronic, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_reggae = Playlist.create!({title:"Reggae", user: user})
songs_data = ItunesService.search_by_genre("reggae")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_reggae, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_country = Playlist.create!({title:"Country", user: user})
songs_data = ItunesService.search_by_genre("country")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_country, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_metal = Playlist.create!({title:"Metal", user: user})
songs_data = ItunesService.search_by_genre("metal")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_metal, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_indie = Playlist.create!({title:"Indie", user: user})
songs_data = ItunesService.search_by_genre("indie")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_indie, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_latin = Playlist.create!({title:"Latin", user: user})
songs_data = ItunesService.search_by_genre("latin")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_latin, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_kpop = Playlist.create!({title:"K-Pop", user: user})
songs_data = ItunesService.search_by_genre("kpop")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_kpop, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_rapfr = Playlist.create!({title:"Rap FR", user: user})
songs_data = ItunesService.search_by_genre("rap français")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_rapfr, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_rapus = Playlist.create!({title:"Rap US", user: user})
songs_data = ItunesService.search_by_genre("american rap")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_rapus, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_pop = Playlist.create!({title:"Pop", user: user})
songs_data = ItunesService.search_by_genre("pop")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_pop, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_60s = Playlist.create!({title:"60s Hits", user: user})
songs_data = ItunesService.search_by_genre("60s oldies")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_60s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_70s = Playlist.create!({title:"70s Hits", user: user})
songs_data = ItunesService.search_by_genre("70s hits")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_70s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_80s = Playlist.create!({title:"80s Hits", user: user})
songs_data = ItunesService.search_by_genre("80s hits")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_80s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_90s = Playlist.create!({title:"90s Hits", user: user})
songs_data = ItunesService.search_by_genre("90s hits")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_90s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_2000s = Playlist.create!({title:"2000s Hits", user: user})
songs_data = ItunesService.search_by_genre("2000s hits")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_2000s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_oldies = Playlist.create!({title:"Oldies", user: user})
songs_data = ItunesService.search_by_genre("oldies classics")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_oldies, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_motown = Playlist.create!({title:"Motown", user: user})
songs_data = ItunesService.search_by_genre("motown")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_motown, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end
playlist_house = Playlist.create!({title:"House", user: user})
songs_data = ItunesService.search_by_genre("house")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_house, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end

playlist_2010s = Playlist.create!({title:"2010s Hits", user: user})
songs_data = ItunesService.search_by_genre("2010s hits")
songs_data.each do |song_data|
  Song.create!(playlist: playlist_2010s, title: song_data[:title], artist: song_data[:artist], preview_url: song_data[:preview_url], year: song_data[:year])
end




