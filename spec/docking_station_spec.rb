require 'docking_station'

describe DockingStation do 
  describe "initialization" do
    it 'has a variable capacity' do 
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(Bike.new) }
      expect {docking_station.dock(Bike.new) }.to raise_error 'Docking station is full'
    end
  end

  describe '#release_bike' do
    it "releases a bike" do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end 
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe "#working?" do 
    it "releases working bikes" do
      bike = Bike.new
      expect(bike.working?).to eq(true)
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a bike" do
      expect(subject.dock(Bike.new)).to eq(subject.bikes)
    end

    it "raises an error when docking station is at capacity" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station is full'
    end
  end

  describe "#bikes" do 
    it { is_expected.to respond_to(:bikes) } 

    it "returns docked bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq([bike])
    end
  end

  describe "#capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
  end
end