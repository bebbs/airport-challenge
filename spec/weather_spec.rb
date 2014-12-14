require 'weather'

describe 'Weather' do

  # Wrap the weather module into a class so we can test it.
  class WeatherWrapper
    include Weather
  end

  let(:weather) { WeatherWrapper.new }

  it 'has a chance of being stormy' do
    expect(weather.chance_of_storm).to be_between(0,1)
  end

  it 'storms can be of varying severity' do
    expect(weather.storm_severity).to be_between(0.1,0.4)
  end


end