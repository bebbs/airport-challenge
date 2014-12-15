module Weather

  # Returns a float between 0 and 1.
  def chance_of_storm
    rand
  end
  
  # Sometimes the storm will be too severe.
  def storm_severity
    rand(0.2..0.3)
  end

  # Compare the chance of a storm with its severity. 
  # If it is too severe, no planes can takeoff/land 
  def weather_condition
    if chance_of_storm <= storm_severity
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    weather_condition
    @stormy
  end

end
