require 'docking_station'

describe DockingStation do 
    # it "should release bike" do
    #     expect(DockingStation).to respond_to(release_bike)
    # end

    it { is_expected.to respond_to(:release_bike) }
end