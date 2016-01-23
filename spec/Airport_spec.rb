require "./lib/Air_traffic_controller.rb"

describe Airport do

  describe "#defult maximum capacity" do
    let(:plane) {double :plane}
    let(:weather) {double :weather}
    let(:air_traffic_controller) {double :air_traffic_controller}

    it "has a defult maximum capacity of 20 and reports as full when reached" do
      allow(air_traffic_controller).to receive(:land_plane).and_return([plane])
      allow(weather).to receive(:is_bad?).and_return(false)
      21.times{subject.new_plane_landed(plane)}
      expect(subject.is_full?).to eq true
    end

    it "allows the maximum capacity to be changed when initialize" do
      airport = Airport.new(30)
      21.times{airport.new_plane_landed(plane)}
      expect(airport.is_full?).to eq false
      expect(airport.capacity).to eq 30
    end

  end

end