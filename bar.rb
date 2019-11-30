class Bar

  attr_reader :name, :rooms, :entry_fee, :till

  def initialize(name, rooms, entry_fee, till)
    @name = name
    @rooms = rooms
    @entry_fee = entry_fee
    @till = till
  end

  def add_room(room_no, songs, capacity, guests)
    room = Room.new(room_no, songs, capacity, guests)
    @rooms.push(room)
  end

  def take_fee(guest)
    guest.pay_entry(@entry_fee)
    @till += @entry_fee
  end

  def sell_drink(guest, drink)
    guest.buy_drink(drink)
    @till += drink.price
  end

  def total_capacity()
    room_capacities = @rooms.map { |room| room.capacity }
    total_capacity = room_capacities.reduce { |running_total, capacity| running_total + capacity }
  end

  def total_guest_count()
    room_guests = @rooms.map { |room| room.guests.length }
    total_guests = room_guests.reduce { |running_total, guests| running_total + guests }
  end

  def allocate_excess_guests(guest)
    total_capacity = total_capacity()
    total_guests = total_guest_count()
    if total_guests < total_capacity
      rooms_with_space = @rooms.select { |room| room.guests.length < room.capacity }
      rooms_with_space[0].check_guest_into_room(guest)
    else
      return "Sorry, you'll need to find another bar!"
    end
  end

end
