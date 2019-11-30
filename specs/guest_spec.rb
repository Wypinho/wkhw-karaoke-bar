require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../guest')
require_relative('../room')
require_relative('../bar')

class GuestTest < Minitest::Test

  def setup

    @song1 = Song.new("Sweet Caroline")

    @guest1 = Guest.new("Andrew Wyper", 50, "Song 2")

    @room1 = Room.new(1, @song1, 5, @guest1)

    @bar = Bar.new("Andy's Karaoke Paradise", @room1, 5, 5000)

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

  def test_guest_can_pay_entry()
    @guest1.pay_entry(@bar.entry_fee)
    assert_equal(45, @guest1.money)
  end

end
