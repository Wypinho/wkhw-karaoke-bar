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

end
