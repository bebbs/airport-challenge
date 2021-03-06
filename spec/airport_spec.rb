require 'airport'
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  NEW_CAPACITY = 50

  let(:plane) { double(:plane) }
  let(:airport) { Airport.new(capacity: NEW_CAPACITY) }

  before(:each) do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  def fill_airport(number_of_planes)
    number_of_planes.times { airport.land_plane(plane) }
  end

  it 'intially has no planes' do
    expect(airport.planes.length).to eq 0
  end

  it 'can be full' do
    fill_airport(NEW_CAPACITY)
    expect(airport).to be_full
  end

  it 'can be empty' do
    fill_airport(0)
    expect(airport).to be_empty
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
      fill_airport(NEW_CAPACITY)
      expect(lambda { airport.request_landing(plane) }).to raise_error(RuntimeError, "This airport is full!")
    end

    context 'weather conditions' do

    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:stormy?) { true }
        expect(lambda { airport.request_take_off(plane) }).to raise_error(RuntimeError, "It is too stormy to take off!")
      end

      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:stormy?) { true }
        expect(lambda { airport.request_landing(plane) }).to raise_error(RuntimeError, "It is too stormy to land!")
      end

    end
  end
end