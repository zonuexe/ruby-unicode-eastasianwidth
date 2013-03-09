require File.expand_path('../spec_helper', __FILE__)

describe Unicode::EastAsianWidth do
  context 'first' do
    it {expect(Unicode::EastAsianWidth.versions).to be_a Hash }    
    it {expect(Unicode::EastAsianWidth.versions).to be_empty }
    it {expect(Unicode::EastAsianWidth.eaw).to be_a Unicode::EastAsianWidth::EawTxt }
  end

  describe "."
end
