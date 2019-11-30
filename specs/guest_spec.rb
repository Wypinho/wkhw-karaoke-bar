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
    @song2 = Song.new("Song 2")

    @songs = [@song1]

    @guest1 = Guest.new("Andrew Wyper", 50, @song2)

    @room1 = Room.new(1, @songs, 5, @guest1)

    @bar = Bar.new("Andy's Karaoke Paradise", @room1, 5, 5000)

  end

  def test_guest_has_name()
    assert_equal("Andrew Wyper", @guest1.name)
  end

  def test_guest_has_money()
    assert_equal(50, @guest1.money)
  end

  def test_guest_has_favourite_song()
    assert_equal(@song2, @guest1.favourite_song)
  end

  def test_guest_can_pay_entry()
    @guest1.pay_entry(@bar.entry_fee)
    assert_equal(45, @guest1.money)
  end

  def test_guest_cheers_favourite_song_in_playlist__positive()
    @room1.add_song(@song2)
    assert_equal("Ya dancer!", @guest1.cheer_favourite_song(@room1.songs))
  end

  def test_guest_cheers_favourite_song_in_playlist__negative()
    assert_nil(@guest1.cheer_favourite_song(@room1.songs))
  end

end
