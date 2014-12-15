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
    expect(weather.storm_severity).to be_between(0.2,0.4)
  end

  it 'sets a weather condition of stormy' do
    allow(weather).to receive(:stormy?) { true }
    expect(weather.stormy?).to be true
  end

  it 'sets a weather condition of not stormy' do
    allow(weather).to receive(:stormy?) { false }
    expect(weather.stormy?).to be false
  end
end