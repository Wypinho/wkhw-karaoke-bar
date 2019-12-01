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
    @guest3 = Guest.new("Lewis Wyper", 2, @song4)
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

  def test_bar_can_take_entry_fee__sufficient_funds()
    @bar.take_fee(@guest1)
    assert_equal(5005, @bar.till)
  end

  def test_bar_can_take_entry_fee__insufficient_funds()
    @bar.take_fee(@guest3)
    assert_equal(5000, @bar.till)
  end

  def test_check_bars_total_capacity()
    assert_equal(15, @bar.total_capacity())
  end

  def test_check_bars_total_guest_count()
    assert_equal(14, @bar.total_guest_count())
  end

  def test_bar_allocates_guests_to_rooms_with_capacity__capacity_exists()
    @bar.allocate_excess_guests(@guest5)
    assert_equal(5, @room3.guests.length)
  end

  def test_bar_allocates_guests_to_rooms_with_capacity__no_capacity()
    @bar.allocate_excess_guests(@guest5)
    assert_equal("Sorry, you'll need to find another bar!", @bar.allocate_excess_guests(@guest6))
  end

  def test_tab_for_guest_starts_at_zero()
    assert_equal(0, @bar.check_tab(@guest1))
  end

  def test_bar_creates_tab_for_guest__sufficient_funds()
    @bar.add_drink_to_tab(@guest1, @drink1)
    assert_equal(5, @bar.check_tab(@guest1))
  end

  def test_bar_tab_for_guest_builds_up__sufficient_funds()
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest2, @drink1)
    @bar.add_drink_to_tab(@guest2, @drink1)
    assert_equal(15, @bar.check_tab(@guest1))
    assert_equal(10, @bar.check_tab(@guest2))
  end

  def test_bar_creates_tab_for_guest__insufficient_funds()
    @bar.add_drink_to_tab(@guest3, @drink1)
    assert_equal(0, @bar.check_tab(@guest3))
  end

  def test_bar_can_redeem_bar_tabs()
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest1, @drink1)
    @bar.add_drink_to_tab(@guest2, @drink1)
    @bar.add_drink_to_tab(@guest2, @drink1)
    @bar.redeem_bar_tab(@guest1)
    @bar.redeem_bar_tab(@guest2)
    # you are here - alter sell drink to redeem_bar_tab and do checks on till and customer money
    assert_equal(5005, @bar.till)
  end

end
