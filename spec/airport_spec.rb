require 'airport'

describe Airport do

  it "has default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "has variable capacity" do
    airport = Airport.new(1000)
    expect(airport.capacity).to eq 1000
  end

  it "should know if 2 planes have landed" do
    plane1 = double(:plane)
    allow(plane1).to receive(:land).with(subject).and_return(subject.landed_planes << plane1)
    plane2 = double(:plane)
    allow(plane2).to receive(:land).with(subject).and_return(subject.landed_planes << plane2)
    plane1.land(subject)
    plane2.land(subject)
    expect(subject.landed_planes).to eq [plane1,plane2]
  end

  it "knows when it is full" do
    41.times do
      subject.landed_planes << Plane.new
    end
    expect(subject.full).to be true
  end

  describe "#stormy_weather" do
    it {is_expected.to respond_to :stormy_weather }

    it "is a random boolean" do
      expect([true, false]).to include subject.stormy_weather
    end
  end

end
