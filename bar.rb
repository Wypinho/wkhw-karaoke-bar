class Bar

  attr_reader :name, :rooms

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
  end

  def add_room(room_no, songs)
    room = Room.new(room_no, songs)
    @rooms.push(room)
  end

end
