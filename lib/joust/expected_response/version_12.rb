class Joust
  class Version12 < ExpectedResponse

    def match?(json_hash)
      return false unless super
      json_hash.has_key?('result') && json_hash.has_key?('error') && json_hash.has_key?('id')
    end

  end
end