require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../bar')

class BarTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")
    @song2 = Song.new("Song 2")
    @song3 = Song.new("My Girl")

    @songs = [@song1, @song2, @song3]

    @guest1 = Guest.new("Andrew Wyper", 50, @song2)
    @guest2 = Guest.new("Lynsey Berry", 60, @song3)
    @guest3 = Guest.new("Lewis Wyper", 40, @song4)

    @guests = [@guest1]

    @room1 = Room.new(1, @songs, 5, @guests)
    @room2 = Room.new(2, @songs, 5, @guests)
    @room3 = Room.new(3, @songs, 5, @guests)

    @rooms = [@room1, @room2, @room3]

    @bar = Bar.new("Andy's Karaoke Paradise", @rooms, 5, 5000)



  end

  def test_bar_has_name()
    assert_equal("Andy's Karaoke Paradise", @bar.name)
  end

  def test_bar_has_rooms()
    assert_equal(3, @bar.rooms.length)
  end

  def test_bar_has_entry_fee()
    assert_equal(5, @bar.entry_fee)
  end

  def test_bar_has_till()
    assert_equal(5000, @bar.till)
  end

  def test_can_add_rooms()
    @bar.add_room(4, @songs, 5, @guests)
    assert_equal(4, @bar.rooms.length)
  end

  def test_bar_can_grant_entry__take_fee()
    @bar.take_fee(@guest1)
    assert_equal(5005, @bar.till)
  end

end
