require 'airport'
require 'plane'
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new(:capacity => 20) }
  let(:plane)   { Plane.new }

  def fill_airport(number_of_planes, airport)
    number_of_planes.times { airport.land_plane(Plane.new) }
  end

  it "has an array of planes" do
    expect(airport.planes).to be_kind_of(Array)
  end

  context 'taking off and landing' do

    it 'a plane can land' do
      airport.land_plane(plane)
      expect(airport.planes).to contain_exactly(plane)
    end

    it 'a plane can take off' do
      airport.dispatch_plane(plane)
      expect(airport.planes).not_to contain_exactly(plane)
    end
  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      fill_airport(20, airport)
      expect(lambda { airport.request_landing(plane) }).to raise_error("This airport is full!")
    end
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
      end

      it 'a plane cannot land in the middle of a storm' do
      end

    end
  end
end