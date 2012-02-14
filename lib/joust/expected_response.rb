class Joust
  class ExpectedResponse

    def match?(json_hash)
      begin
        ['result', 'error', 'id'].each { |key| @expected[key] = :missing if !@expected.has_key?(key) }
        if json_hash.empty?
          return false unless @expected.values == [:missing, :missing, :missing]
          return true
        end
        @expected.each do |key, val|
          next if val == :missing && !json_hash.has_key?(key)
          return false unless json_hash[key] == val
        end
        true
      rescue Exception
        false
      end
    end

  end
end