require 'docking_station'

describe DockingStation do 
  describe '#release_bike' do
    it "releases a bike" do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end 
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it "releases working bikes" do
    bike = Bike.new
    expect(bike).to be_working
  end

  describe "#dock" do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks a bike" do
      expect(subject.dock(Bike.new)).to eq(subject.bikes)
    end

    it "raises an error when docking station is at capacity" do
      20.times { subject.dock(Bike.new) }
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
end