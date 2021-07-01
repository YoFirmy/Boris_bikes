require 'docking_station'

describe DockingStation do 
    it { is_expected.to respond_to(:release_bike) }

    before do
        @bike = subject.release_bike
    end

    it "releases working bikes" do
        expect(@bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }
end