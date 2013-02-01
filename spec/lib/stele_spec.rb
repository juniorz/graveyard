require 'spec_helper'
require 'graveyard/stele'

describe Graveyard::Stele do
  let(:value) { "Ixkun" }
  let(:stele) { Graveyard::Stele.new(value) }

  it 'acts like its value' do
    value.should_receive(:foo).and_return(:bar)
    stele.foo.should == :bar
  end

  describe :is_a? do
    it 'is a Stele' do
      stele.should be_a(Graveyard::Stele)
    end

    it 'is a value' do
      stele.should be_a(String)
    end
  end

  describe :visit do

  end
end
