require File.expand_path('../../spec_helper', __FILE__)

describe Unicode::EastAsianWidth::EawTxt do
  context "class methods" do
    describe ".paths" do
      let(:paths){ Unicode::EastAsianWidth::EawTxt.paths }
      it { expect(paths).to be_a Array }
      it { expect(paths.map{|p| p.is_a? Pathname}.all?).to be_true }
    end
  end
end
