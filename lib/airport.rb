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

  def empty?
    planes.length == 0
  end

  def request_landing(plane)
    if full? 
      raise "This airport is full!"
    elsif stormy?
      raise "It is too stormy to land!"
    else
      land_plane(plane)
    end
  end

  def land_plane(plane)
    planes << plane
    plane.land
  end

  def request_take_off(plane)
    if stormy?
      raise "It is too stormy to take off!"
    else
      dispatch_plane(plane)
    end
  end

  def dispatch_plane(plane)
    planes.delete(plane)
    plane.take_off
  end

end