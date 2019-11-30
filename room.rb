class Room

  attr_reader :number, :songs, :capacity, :guests

  def initialize(number, songs, capacity, guests = [])
    @number = number
    @songs = songs
    @capacity = capacity
    @guests = guests
  end

  def add_song(song)
    @songs.push(song)
  end

  def check_guest_into_room(guest)
    if @guests.length < @capacity
      @guests.push(guest)
      # should be moving to another room with capacity
    end
  end

  def check_guest_out_of_room(guest)
    @guests.delete(guest)
  end

end
