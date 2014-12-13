module Weather

  def weather_condition
    chance = rand
    if chance <= 0.2
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end

end