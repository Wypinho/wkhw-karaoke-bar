require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')

class GuestTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")

    @guest1 = Guest.new("Andrew Wyper", 50, "Song 2")

  end

  def test_guest_has_name()
    assert_equal("Andrew Wyper", @guest1.name)
  end

  def test_guest_has_money()
    assert_equal(50, @guest1.money)
  end

  def test_guest_has_favourite_song()
    assert_equal("Song 2", @guest1.favourite_song)
  end

end
