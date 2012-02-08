class Joust
  class Version20 < ExpectedResponse

    def match?(json_hash)
      return false unless super
      return true if json_hash.empty? && @expected.values == [:missing, :missing, :missing]
      json_hash['jsonrpc'] == '2.0' && (!!json_hash['result'] ^ !!json_hash['error'])
    end

  end
end