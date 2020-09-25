# frozen_string_literal: true

# frequency counter
#

class Anagram
  class << self
    def call(str_1, str_2)
      return true if str_1.empty? && str_2.empty?

      build_freq(str_1) do |str_1_freq|
        build_freq(str_2) do |str_2_freq|
          str_1_freq.each do |key, value|
            return false if str_2_freq[key] != value
          end
        end
      end

      true
    end

    private

    def build_freq(string, &block)
      freq = string.split(//).each_with_object({}) do |n, acc|
        if acc.key?(n)
          acc[n] += 1
        else
          acc[n] = 1
        end
      end

      block.call(freq) if block_given?

      freq
    end
  end
end
