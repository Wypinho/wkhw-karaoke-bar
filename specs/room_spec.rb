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
    @song4 = Song.new("Help!")

    @songs = [@song1, @song2, @song3]

    @guest1 = Guest.new("Andrew Wyper", 50, @song2)
    @guest2 = Guest.new("Lynsey Berry", 60, @song3)
    @guest3 = Guest.new("Lewis Wyper", 40, @song4)
    @guest4 = Guest.new("Finlay Wyper", 50, @song2)
    @guest5 = Guest.new("Jack Wyper", 30, @song4)
    @guest6 = Guest.new("Lesley Wyper", 20, @song3)

    @guests = [@guest1]

    @room1 = Room.new(1, @songs, 5, @guests)
    @room2 = Room.new(2, @songs, 5, @guests)
    @room3 = Room.new(3, @songs, 5, @guests)

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
    @room1.add_song(@song4)
    assert_equal(4, @room1.songs.length)
  end

  def test_can_check_guest_into_room()
    @room1.check_guest_into_room(@guest2)
    assert_equal(2, @room1.guests.length)
  end

  def test_can_check_guest_out_of_room()
    @room1.check_guest_out_of_room(@guest1)
    assert_equal(0, @room1.guests.length)
  end

  def test_test_can_check_guest_into_room__exceed_capacity()
    @room1.check_guest_into_room(@guest2)
    @room1.check_guest_into_room(@guest3)
    @room1.check_guest_into_room(@guest4)
    @room1.check_guest_into_room(@guest5)
    @room1.check_guest_into_room(@guest6)
    assert_equal(5, @room1.guests.length)
  end

end
