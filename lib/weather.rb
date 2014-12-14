module Weather

  # Returns a float between 0 and 1.
  def chance_of_storm
    rand
  end
  
  # Sometimes the storm will be too severe.
  def storm_severity
    rand(0.1..0.4)
  end

  # Compare the chance of rain to what was forecasted.
  def weather_condition
    if chance_of_storm <= storm_severity
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end

end