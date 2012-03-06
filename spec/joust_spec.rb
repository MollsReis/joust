require 'spec_helper'

describe Joust do

  describe '.run' do
    context 'given a target url, options, and a test case file' do
      it 'creates a new instance if joust and runs the tests' do
        fake_joust = double('joust')
        fake_joust.should_receive(:check)
        Joust.should_receive(:new).and_return(fake_joust)
        Joust.run('http://url', {:foo => :bar}, {:version => :foo})
      end
    end
  end

  describe '#initialize' do
    context 'given a target url, options, and a test case file' do
      it 'creates a new instance of Joust' do
        joust = Joust.new('http://url', {:foo => :bar}, {:version => :foo})
        joust.should be_instance_of Joust
      end
    end
  end

  describe '#check' do
    it 'runs the test cases' do
      pending
    end
  end

end