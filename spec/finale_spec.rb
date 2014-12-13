require 'plane'
require 'airport'

# grand finale
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do

    let(:airport){ Airport.new(:capacity => 6) }
    let(:plane) { Plane.new }

  it 'all planes can land and all planes can take off' do

    land_all_planes
    
    expect(airport.full?).to be true            # Ensure that the airport is full.

    airport.planes.each do |plane|              # Check that all landed planes have a 
      expect(plane.flying?).to be false         # are not flying.
    end

    all_take_off

    airport.planes.each do |plane|              # Check that each plane is now flying.
      expect(plane.flying?).to be true          
    end

  end

  # HELPER METHODS

  def land_all_planes
    while !airport.full?                        # While the airport still has capacity, 
      airport.request_landing(plane)            # keep landing new planes.
    end
  end

  def all_take_off
    airport.planes.each do |plane|              # While there are still planes at the 
      airport.request_take_off(plane)           # airport, keep requesting take off slots.
    end
  end

end

