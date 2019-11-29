class Room

  attr_reader :number, :songs

  def initialize(number, songs)
    @number = number
    @songs = songs
  end

  def add_song(song_name)
    song = Song.new(song_name)
    @songs.push(song)
  end

end
