require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @planes = []
  end

  def full?
    planes.length == capacity
  end

  def empty?
    planes.length == 0
  end

  def request_landing(plane)
    raise 'This airport is full!' if full? 
    raise 'It is too stormy to land!' if stormy?
    land_plane(plane)
  end

  def land_plane(plane)
    plane.land
    planes << plane
  end

  def request_take_off(plane)
    raise "It is too stormy to take off!" if stormy?
    dispatch_plane(plane)
  end

  def dispatch_plane(plane)
    plane.take_off
    planes.delete(plane)
  end

end