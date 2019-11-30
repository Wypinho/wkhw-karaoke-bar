class Bar

  attr_reader :name, :rooms, :entry_fee

  def initialize(name, rooms, entry_fee)
    @name = name
    @rooms = rooms
    @entry_fee = entry_fee
  end

  def add_room(room_no, songs, capacity, guests)
    room = Room.new(room_no, songs, capacity, guests)
    @rooms.push(room)
  end

end
