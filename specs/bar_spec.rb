require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')
require_relative('../room')
require_relative('../guest')
require_relative('../bar')
require_relative('../drink')

class BarTest < Minitest::Test

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

    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]

    @room1 = Room.new(1, @songs, 5, @guests)
    @room2 = Room.new(2, @songs, 5, @guests)
    @room3 = Room.new(3, @songs, 5, [@guest1, @guest2, @guest3, @guest4])

    @rooms = [@room1, @room2, @room3]

    @drink1 = Drink.new(5)

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

  def test_bar_can_sell_drink()
    @bar.sell_drink(@guest1, @drink1)
    assert_equal(5005, @bar.till)
  end

  def test_check_bars_total_capacity()
    assert_equal(15, @bar.total_capacity())
  end

  def test_check_bars_total_guest_count()
    assert_equal(14, @bar.total_guest_count())
  end

end
