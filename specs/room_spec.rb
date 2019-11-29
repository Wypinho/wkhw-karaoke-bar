require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')

class RoomTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")

    @guest1 = Guest.new("Andrew Wyper")

    @room1 = Room.new(1)

  end

  def test_room_has_number()
    assert_equal(1, @room1.number)
  end

end
