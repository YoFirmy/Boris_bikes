require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  describe "#report_broken" do
    it "can be reported as broken" do
      expect(subject).to respond_to(:report_broken)
    end
  end
end
