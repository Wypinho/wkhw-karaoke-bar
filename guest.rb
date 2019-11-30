class Guest

  attr_reader :name, :money, :favourite_song

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def pay_entry(fee)
    @money -= fee
  end

  def cheer_favourite_song(songs)
    if songs.include?(@favourite_song)
      return "Ya dancer!"
    else
      return nil
    end
  end

  def buy_drink(drink)
    @money -= drink.price
  end

end
