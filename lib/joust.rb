require 'rest-client'

class Joust

  # run each version spec and return results
  def self.run(url, options, test_cases)
    specs = options[:version].inject([]) { |specs, ver| specs << self.new(url, test_cases[ver], ver); specs }
    results = specs.inject([]) { |res, spec| res << spec.check; res }
    puts results
  end

  # initialize an instance to test a specific version
  def initialize(url, test_cases, version)
    @url, @test_cases, @version = url, test_cases, version
  end

  # run specification checks and return results
  def check
    num_tests = passed_tests = 0
    results = @test_cases.map(&:flatten).inject([]) do |results, test|
      resp = RestClient.post(@url, test.last.first, :content_type => 'application/json')
      num_tests += 1
      if resp.body =~ test.last.last
        passed_tests += 1
        result_output = 'PASS'
      else
        result_output = 'FAIL: ' + resp.body
      end
      results << "#{@version} #{test.first} -- #{result_output}"
      results
    end
    results << "JSON-RPC #{@version}: #{passed_tests}/#{num_tests} tests passed"
  end

end