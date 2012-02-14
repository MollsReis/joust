class Joust
  class Version20 < ExpectedResponse

    def match?(json_hash)
      return false unless super
      (json_hash['jsonrpc'] == '2.0' && (!!json_hash['result'] ^ !!json_hash['error'])) || json_hash.empty?
    end

  end
end