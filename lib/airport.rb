require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity= (value)
    @capacity = value
  end

  def full?
    planes.length == capacity
  end

  def request_landing(plane)
    if full? 
      raise "This airport is full!"
    else
      lane_plane(plane)
    end
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