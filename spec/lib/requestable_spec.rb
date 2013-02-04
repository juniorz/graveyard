require 'spec_helper'
require 'graveyard/requestable'

describe Graveyard::Requestable do
  let(:target) { "http://foo.bar" }
  let(:requestable) {
    class << target
      include Graveyard::Requestable
    end
    target
  }

  Graveyard::Requestable::METHODS.each do |method|
    it "responds to #{method}" do
      requestable.should respond_to(method)
    end
  end

  it 'is requestable' do
    requestable.should be_requestable
  end

  describe :connection do
    let(:extras) { {foo: :bar } }
    subject { requestable.get extras }

    it 'handles the requests' do
      conn_mock = mock('connection')
      requestable.should_receive(:connection).and_return(conn_mock)
      conn_mock.should_receive(:get).with(target, extras)

      subject
    end

    it 'defaults to Faraday default connection' do
      Faraday.should_receive(:get).with(target, extras)

      subject
    end
  end
end
