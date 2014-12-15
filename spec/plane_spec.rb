
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

require 'plane'
require 'weather'

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane.flying?).to be true
  end

  it 'has a flying status when in the air' do
    plane.take_off
    expect(plane.flying?).to be true
  end

  it 'can take off' do
    plane.take_off
    expect(plane.flying?).to be true
  end

  it 'can land' do
    plane.land
    allow(plane).to receive(:flying?) { false }
    expect(plane.flying?).to be false
  end

  it 'changes its status to flying after taking off' do
    allow(plane).to receive(:flying?) { false }
    expect(plane.flying?).to be false
    plane.take_off
    allow(plane).to receive(:flying?) { true }
    expect(plane.flying?).to be true
  end
end