class Plane

  attr_writer :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def take_off
    @flying = true
  end

  def land
    @flying = false
  end

  def grounded?
  end

end
