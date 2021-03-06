# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Clears the database
User.destroy_all
Host.destroy_all
Party.destroy_all
Song.destroy_all
QueuedSong.destroy_all
PlayedSong.destroy_all
Rule.destroy_all
Guest.destroy_all

# Creates User
user1 = User.create(
  phone_number: "+16103315573"
  )


user2 = User.create(
  phone_number: "+16467524876", 
  )

# Creates Host
host = Host.create(
  user_id: user1.id, 
  email: "michael.k.wagner@gmail.com",
  first_name: "Michael", 
  last_name: "Wagner", 
  password: "winner", 
  password_confirmation: "winner",
  zip: 10128
  )

host2 = Host.create(
  user_id: user2.id, 
  email: "etan.berkowitz@gmail.com",
  first_name: "Etan", 
  last_name: "Berkowitz", 
  password: "donkeypiss", 
  password_confirmation: "donkeypiss",
  zip: 10024,
  )

# Creates Party
party1 = Party.create(
  host_id: host.id, 
  party_key: "#wagparty", 
  party_expiry: Time.now + 5*60*60 
  )

party2 = Party.create(
  host_id: host2.id, 
  party_key: "#berkoparty", 
  party_expiry: Time.now + 5*60*60 
  )

party3 = Party.create(
  host_id: host.id, 
  party_key: "#wagparty2", 
  party_expiry: Time.now - 5*60
  )

party4 = Party.create(
  host_id: host.id, 
  party_key: "#wagparty3", 
  party_expiry: Time.now - 172*60
  )

# Creates Songs
song1 = Song.create(
  grooveshark_id: 408271,
  title: "Oxford Comma",
  artist: "Vampire Weekend",
  duration: 196000, 
  album_art: "http://a2.mzstatic.com/us/r30/Music2/v4/1e/44/17/1e441710-625e-4cf4-f6f4-8d721b737f7d/Vamprie_Weekend_-_Modern_Vampires."
  )

song2 = Song.create(
  grooveshark_id: 936496,
  title: "Me and Julio down by the School",
  artist: "Paul Simon",
  duration: 163000, 
  album_art: "http://a4.mzstatic.com/us/r30/Features4/v4/41/00/be/4100be09-0f75-a5de-3dc5-03f2d386d954/dj.brkzaqgz."
  )

song3 = Song.create(
  grooveshark_id: 25133412,
  title: "Enter Sandman",
  artist: "Metallica",
  duration: 332000, 
  album_art: "http://a3.mzstatic.com/us/r30/Music/v4/9a/41/03/9a410309-7dbe-fce4-a6be-43101f0a1352/0093624986553."
  )

song4 = Song.create(
  grooveshark_id: 229996995,
  title: "Award Tour",
  artist: "Tribe Called Quest",
  duration: 222093, 
  album_art: "http://a3.mzstatic.com/us/r30/Features/ef/12/97/dj.gqlipupq."
  )

song5 = Song.create(
  grooveshark_id: 25887138,
  title: "The Trapeze Swinger",
  artist: "Iron and Wine",
  duration: 204693, 
  album_art: "http://a3.mzstatic.com/us/r30/Music/v4/a5/b6/98/a5b69860-2851-8ebb-7329-0a6b9576edea/UMG_cvrart_00602537276257_01_RGB72_1800x1800_12UMGIM65317."
  )


# Adds songs to the queue
queue_song1 = QueuedSong.create(
  party_id: party1.id, 
  song_id: song1.id, 
  user_id: user1.id, 
  upvotes: 0, 
  downvotes: 0, 
  total_votes: 0
  )

queue_song2 = QueuedSong.create(
  party_id: party1.id, 
  song_id: song2.id, 
  user_id: user1.id, 
  upvotes: 0, 
  downvotes: 0,
  total_votes: 0
  )

queue_song3 = QueuedSong.create(
  party_id: party1.id, 
  song_id: song3.id, 
  user_id: user1.id, 
  upvotes: 0, 
  downvotes: 0,
  total_votes: 0
  )


played_song4 = PlayedSong.create(
  party_id: party3.id, 
  song_id: song4.id, 
  user_id: user1.id, 
  upvotes: 0, 
  downvotes: 0,
  total_votes: 0
  )

played_song5 = PlayedSong.create(
  party_id: party4.id, 
  song_id: song5.id, 
  user_id: user1.id, 
  upvotes: 0, 
  downvotes: 0,
  total_votes: 0
)

rule1 = Rule.create(
  condition: "artist", 
  banned_value: "Justin Beiber"
  )

rule2 = Rule.create( 
  condition: "title", 
  banned_value: "Bye Bye Bye"
  )

party1.rules << rule1
party1.rules << rule2
