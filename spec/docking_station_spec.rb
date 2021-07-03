require 'docking_station'

describe DockingStation do 
  describe "initialization" do
    it 'has a variable capacity' do 
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(double(:bike)) }
      expect {docking_station.dock(double(:bike)) }.to raise_error 'Docking station is full'
    end
  end

  describe '#release_bike' do
    it "releases a bike" do
      bike = double(:bike, :broken? => false)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end 
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when only broken bikes are docked' do
      bike = double(:bike, :broken? => true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

    it 'only releases a working bike' do
      # working_bike = Bike.new
      # broken_bike = Bike.new
      # broken_bike.report_broken
      working_bike = double(:working_bike, :broken? => false)
      broken_bike = double(:broken_bike, :broken? => true)
      subject.dock(working_bike)
      subject.dock(broken_bike)
      expect(subject.release_bike).to eq(working_bike)
    end
  end

  describe "#working?" do 
    let(:bike) { double :bike }
    it "releases working bikes" do
      allow(bike).to receive(:working?).and_return(true)
      expect(bike.working?).to eq(true)
    end
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a bike" do
      expect(subject.dock(double(:bike))).to eq(subject.bikes)
    end

    it "raises an error when docking station is at capacity" do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike)) }.to raise_error 'Docking station is full'
    end
  end

  describe "#bikes" do 
    it { is_expected.to respond_to(:bikes) } 

    it "returns docked bikes" do
      bike = double(:bike)
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