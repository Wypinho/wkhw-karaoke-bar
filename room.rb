class Room

  attr_reader :number, :songs, :capacity, :guests#, :bar_tab

  def initialize(number, songs, capacity, guests = [])
    @number = number
    @songs = songs
    @capacity = capacity
    @guests = guests
    # @bar_tab = 0
  end

  def add_song(song)
    @songs.push(song)
  end

# I think I should have done this in the bar class rather than rooms!
  def check_guest_into_room(bar, guest)
    total_capacity = bar.total_capacity
    total_guests = bar.total_guest_count
    if total_guests < total_capacity
      if @guests.length < @capacity
        @guests.push(guest)
        # should be moving to another room with capacity
      end
    end
  end

  def check_guest_out_of_room(guest)
    @guests.delete(guest)
  end

end
