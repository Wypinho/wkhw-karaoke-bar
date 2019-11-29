require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')

class GuestTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")

    @guest1 = Guest.new("Andrew Wyper")

  end

  def test_guest_has_name()
    assert_equal("Andrew Wyper", @guest1.name)
  end

end
