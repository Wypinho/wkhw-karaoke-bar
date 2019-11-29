require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')

class RoomTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")
    @song2 = Song.new("Song 2")
    @song3 = Song.new("My Girl")

    @songs = [@song1, @song2, @song3]

    @guest1 = Guest.new("Andrew Wyper")

    @guests = [@guest1]

    @room1 = Room.new(1, @songs, 5, @guests)

  end

  def test_room_has_number()
    assert_equal(1, @room1.number)
  end

  def test_room_has_songs()
    assert_equal(3, @room1.songs.length)
  end

  def test_room_has_capacity()
    assert_equal(5, @room1.capacity)
  end

  def test_guest_count()
    assert_equal(1, @room1.guests.length)
  end

  def test_can_add_songs()
    @room1.add_song("Help!")
    assert_equal(4, @room1.songs.length)
  end

  def test_can_add_guest()
    # @room1.add_guest("Lynsey Berry")
  end

end
