module Weather

  # Returns a float between 0 and 1.
  def chance_of_storm
    rand
  end
  
  # Sometimes the storm will be too severe.
  def storm_severity
    rand(0.2..0.4)
  end

  # Compare the chance of a storm with its severity. 
  # If it is too severe, no planes can takeoff/land.
  def weather_condition
    @stormy = chance_of_storm < storm_severity
  end

  def stormy?
    weather_condition
    @stormy
  end

end
