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
  
    
    playlist_rnb = Playlist.create!({title:"R'n'b", user: user})
    playlist_blues = Playlist.create!({title:"Blues", user: user})
    playlist_hiphop = Playlist.create!({title:"Hip Hop", user: user})
  

Song.create!(
  [
  playlist_hiphop = [
  {playlist: playlist_hiphop, title: "Da Rockwilder", artist: "Method Man", youtube_url: "https://www.youtube.com/embed/WCYy8jpp7R8" }, 
  {playlist: playlist_hiphop, title: "C.R.E.A.M.", artist: "Wu-Tang Clan", youtube_url: "https://www.youtube.com/embed/PBwAxmrE194" }, 
  {playlist: playlist_hiphop, title: "Time 4 Sum Aksion", artist: "Redman", youtube_url: "https://www.youtube.com/embed/FMUcfbpcIeg?list=RDFMUcfbpcIeg" }, 
  {playlist: playlist_hiphop, title: "Woo Hah!! Got You All in Check", artist: "Busta Rhymes", youtube_url: "https://www.youtube.com/embed/EQzvQO2LcA4?list=RDEQzvQO2LcA4" }, 
  {playlist: playlist_hiphop, title: "The World Is Yours", artist: "Nas", youtube_url: "https://www.youtube.com/embed/e5PnuIRnJW8?list=RDe5PnuIRnJW8" },  
  {playlist: playlist_hiphop, title: "Shook Ones Pt. II", artist: "Mobb Deep", youtube_url: "https://www.youtube.com/embed/yoYZf-lBF_U?list=RDyoYZf-lBF_U" },  
  {playlist: playlist_hiphop, title: "Mass Appeal", artist: "Gang Starr", youtube_url: "https://www.youtube.com/embed/y9lNbNGbo24?list=RDy9lNbNGbo24" }, 
  {playlist: playlist_hiphop, title: "Guess Who's Back", artist: "Rakim", youtube_url: "https://www.youtube.com/embed/c7ilAD54Lqo?list=RDc7ilAD54Lqo" },  
  {playlist: playlist_hiphop, title: "Nuthin’ But a “G” Thang", artist: "Dr. Dre", youtube_url: "https://www.youtube.com/embed/8GliyDgAGQI?list=RD8GliyDgAGQI" }, 
  {playlist: playlist_hiphop, title: "Scenario", artist: "A Tribe Called Quest", youtube_url: "https://www.youtube.com/embed/Q6TLWqn82J4?list=RDQ6TLWqn82J4" }
]
  ]
)
  Song.create!(
    [
playlist_blues = [
  {playlist: playlist_blues,title: "I'LL play the blues for you", artist:"daniel castro", youtube_url: "https://www.youtube.com/embed/ioOzsi9aHQQ"}, 
  {playlist: playlist_blues,title: "The sky is crying", artist:"gary B.B coleman", youtube_url: "https://www.youtube.com/embed/71Gt46aX9Z4"}, 
  {playlist: playlist_blues,title: "Make it rain", artist:"Foy Vance", youtube_url: "https://www.youtube.com/embed/hD5hIqeKNVE"},  
  {playlist: playlist_blues,title: "Slightly hung over", artist:"Blues Delight", youtube_url: "https://www.youtube.com/embed/zq7hltwb_yc"},  
  {playlist: playlist_blues,title: "At Last", artist:"Etta James", youtube_url: "https://www.youtube.com/embed/S-cbOl96RFM"},  
  {playlist: playlist_blues,title: "Everyday I have The Blues", artist:"B.B king ", youtube_url: "https://www.youtube.com/embed/xtwUqXCQvAI"}, 
  {playlist: playlist_blues,title: "Stay Around A little Longer", artist:"Buddy Guy", youtube_url: "https://www.youtube.com/embed/emyt-agLE_s"}, 
  {playlist: playlist_blues,title: " Little Walter My Babe", artist:"Angel Neira", youtube_url: "https://www.youtube.com/embed/duRp_avXtMM"},
  {playlist: playlist_blues,title: "Going Down", artist:"Freddie King", youtube_url: "https://www.youtube.com/embed/V_ONyukSLqA"}, 
  {playlist: playlist_blues,title: "Yes We Can Can", artist:"Allen Toussaint", youtube_url: "https://www.youtube.com/embed/ioOzsi9aHQQ"} 
]
 ] )
 Song.create!(
  [
    playlist_rnb = [
      {playlist: playlist_rnb,title: "With You", artist: "Chris Brown", youtube_url:  "https://www.youtube.com/embed/nmjdaBaZe8Y"},   
      {playlist: playlist_rnb,title: "The Boy Is Mine", artist: "Brandy & Monica  ", youtube_url:  "https://www.youtube.com/embed/qSIOp_K5GMw"}, 
      {playlist: playlist_rnb,title: "Can We Talk", artist: "Tevin Campbell", youtube_url:  "https://www.youtube.com/embed/3SoYkCAzMBk"}, 
      {playlist: playlist_rnb,title: "Return Of The Mack", artist: "Mark Morrison", youtube_url:  "https://www.youtube.com/embed/uB1D9wWxd2w"},
      {playlist: playlist_rnb,title: "This Is How We Do It", artist: "Montell Jordan", youtube_url:  "https://www.youtube.com/embed/0hiUuL5uTKc"},
      {playlist: playlist_rnb,title: "Creep", artist: "TLC", youtube_url:  "https://www.youtube.com/embed/LlZydtG3xqI"}, 
      {playlist: playlist_rnb,title: "Don't Walk Away", artist: "Jade", youtube_url:  "https://www.youtube.com/embed/wZ9HG0nGe-g"},
      {playlist: playlist_rnb,title: "Love Like This", artist: "Faith Evans", youtube_url:  "https://www.youtube.com/embed/w1QzBQKYbag"},
      {playlist: playlist_rnb,title: "I'm Dreaming", artist: "Christopher Williams", youtube_url:  "https://www.youtube.com/embed/m51i4HbsI8k"}, 
      {playlist: playlist_rnb,title: "Romantic", artist: "Karyn White", youtube_url:  "https://www.youtube.com/embed/Mu-ty0dC9k4"}
  ]
]
 )
puts "success"
