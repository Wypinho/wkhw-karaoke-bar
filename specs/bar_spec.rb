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

    @guest1 = Guest.new("Andrew Wyper", 50, "Song 2")

    @guests = [@guest1]

    @room1 = Room.new(1, @songs, 5, @guests)
    @room2 = Room.new(2, @songs, 5, @guests)
    @room3 = Room.new(3, @songs, 5, @guests)

    @rooms = [@room1, @room2, @room3]

    @bar = Bar.new("Andy's Karaoke Paradise", @rooms)

  end

  def test_bar_has_name()
    assert_equal("Andy's Karaoke Paradise", @bar.name)
  end

  def test_bar_has_rooms()
    assert_equal(3, @bar.rooms.length)
  end

  def test_can_add_rooms()
    @bar.add_room(4, @songs, 5, @guests)
    assert_equal(4, @bar.rooms.length)
  end

end
