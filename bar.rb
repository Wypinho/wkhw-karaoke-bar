class Bar

  attr_reader :name, :rooms

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
  end

  def add_room(room_no, songs, capacity, guests)
    room = Room.new(room_no, songs, capacity, guests)
    @rooms.push(room)
  end

end
