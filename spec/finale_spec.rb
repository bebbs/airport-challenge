require 'plane'
require 'airport'

# grand finale
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

    let(:airport){ Airport.new(:capacity => 6) }
    let(:plane) { double(:plane) }

    before(:each) do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(plane).to receive(:flying?) { false }
    end

  it 'all planes can land and all planes can take off in good conditions' do

    allow(airport).to receive(:stormy?) { false }

    create_planes(6)

    land_all_planes

    expect(airport.full?).to be true            # Ensure that the airport is full.

    airport.planes.each do |plane|              # Check that all landed planes are 
      expect(plane.flying?).to be false         # not flying.
    end

    all_take_off

    airport.planes.each do |plane|              # Check that each plane is now flying.
      expect(plane.flying?).to be true          
    end

  end

  # HELPER METHODS

  def create_planes(number)
    @plane_array = []
    number.times do
      plane = Plane.new
      @plane_array << plane
    end
  end

  def land_all_planes
    while !airport.full? do
      @plane_array.each do |plane|                # While the airport still has capacity,
        airport.request_landing(plane)            # keep landing new planes.
      end   
    end                
  end

  def all_take_off
    while !airport.empty?
      airport.planes.each do |plane|              # While there are still planes at the 
        airport.request_take_off(plane)           # airport, keep requesting take off slots.
      end
    end
  end

end

