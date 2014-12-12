
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'has a flying status when created' do
    expect(plane.status?).to eq("flying")
  end

  it 'has a flying status when in the air' do
    plane.status = "flying"
    expect(plane.status?).to eq("flying") 
  end

  it 'can take off' do
    plane.status = "ground"
    plane.take_off
    expect(plane.status?).to eq "flying"
  end

  it 'can land' do
    plane.take_off
    plane.land
    expect(plane.status?).to eq "ground"
  end

  it 'changes its status to flying after taking off' do
    plane.status = "ground"
    plane.take_off
    expect(plane.status?).to eq("flying")
  end
end

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

# describe "The grand finale (last spec)" do

#   it 'all planes can land and all planes can take off' do

#   end
# end