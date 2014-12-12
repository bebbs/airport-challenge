class Airport

  def planes
    @planes ||= []
  end

  def land_plane(plane)
    planes << plane
    plane.land
  end

  def dispatch_plane(plane)
    planes.delete(plane)
    plane.take_off
  end

end