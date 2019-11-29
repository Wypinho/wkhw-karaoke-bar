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

    @guest1 = Guest.new("Andrew Wyper")

    @room1 = Room.new(1, @songs)
    @room2 = Room.new(2, @songs)
    @room3 = Room.new(3, @songs)

    @rooms = [@room1, @room2, @room3]

    @bar = Bar.new("Andy's Karaoke Paradise", @rooms)

  end

  def test_bar_has_name()
    assert_equal("Andy's Karaoke Paradise", @bar.name)
  end

  def test_bar_has_rooms()
    assert_equal(3, @bar.rooms.length)
  end



end
