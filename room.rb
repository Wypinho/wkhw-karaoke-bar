class Room

  attr_reader :number, :songs, :capacity, :guests

  def initialize(number, songs, capacity, guests = [])
    @number = number
    @songs = songs
    @capacity = capacity
    @guests = guests
  end

  def add_song(song_name)
    song = Song.new(song_name)
    @songs.push(song)
  end

end
