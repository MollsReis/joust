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
      fake_resp = double('resp')
      fake_resp.stub!(:body)
      content_type = {:content_type => 'application/json'}
      RestClient.should_receive(:post).with('url', 'sent', content_type).and_return(fake_resp)
      fake_expected = double('expected')
      fake_expected.should_receive(:is_a?).with(Array).and_return(false)
      fake_expected.should_receive(:match?).with({}).and_return(true)
      fake_test_cases = [{'test' => ['sent', fake_expected]}]
      joust = Joust.new('url', fake_test_cases, 'v3.14')
      results = joust.check
      results.last.should == "JSON-RPC v3.14: 1/1 tests passed"
    end
  end

end