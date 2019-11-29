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

    @guest1 = Guest.new("Andrew Wyper")

    @room1 = Room.new(1)

    @bar = Bar.new("Andy's Karaoke Paradise")

  end

  def test_bar_has_name()
    assert_equal("Andy's Karaoke Paradise", @bar.name)
  end

end
