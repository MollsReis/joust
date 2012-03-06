require 'spec_helper'

class Joust

  describe ExpectedResponse do

    before(:each) do
      @response = ExpectedResponse.new
      @response.instance_variable_set(:@expected, {})
    end

    describe '#match?' do
      context 'given the json hash is empty' do
        context 'and all the parameters are expected missing' do
          it 'returns true' do
            @response.match?({}).should be_true
          end
        end
        context 'and any of the parameters are not expected to be missing' do
          it 'returns false' do
            @response.instance_variable_set(:@expected, {'result' => 'foo'})
            @response.match?({}).should be_false
          end
        end
      end
      context 'given the json hash is not empty' do
        context 'and all the parmeters match' do
          it 'returns true' do
            @response.instance_variable_set(:@expected, {'result' => 'foo'})
            @response.match?({'result' => 'foo'}).should be_true
          end
        end
        context 'and any of the parameters do not match' do
          it 'returns false' do
            @response.instance_variable_set(:@expected, {'result' => 'foo'})
            @response.match?({'result' => 'bar'}).should be_false
          end
        end
      end
      context 'given the attempted matching generates an exception' do
        it 'returns false' do
          @response.match?(nil).should be_false
        end
      end
    end

  end

end