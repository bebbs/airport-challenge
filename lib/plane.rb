class Plane

  attr_writer :status

  def initialize
    @status = "flying"
  end

  def status?
    @status
  end

  def take_off
    @status = "flying"
  end

  def land
    @status = "ground"
  end

end
