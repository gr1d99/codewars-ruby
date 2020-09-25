# frozen_string_literal: true

# Write a function that accepts two arrays,
# The function should return true if every value in the array has its corresponding value squared in the second array.
# The frequency of values must be the same.
#
# Frequency Counter pattern

class Same
  class << self
    def call_naive(array_1, array_2)
      return false if array_1.length != array_2.length

      array_1.each do |n|
        sqr = n * n
        idx = array_2.index(sqr)
        return false if idx.nil?

        array_2.delete_at(idx)
      end

      true
    end

    def call_frequency(array_1, array_2, &block)
      result = true
      array_1_freq = array_1.each_with_object({}) do |n, acc|
        sqr = n * n
        if acc.key?(sqr)
          acc[sqr] += 1
        else

          acc[sqr] = 1
        end
      end

      array_2_freq = array_2.each_with_object({}) do |n, acc|
        if acc.key?(n)
          acc[n] += 1
        else
          acc[n] = 1
        end
      end

      array_1_freq.each do |key, value|
        if array_2_freq[key] != value
          result = false
          break
        end
      end

      block.call(array_1, array_2, result) if block_given?

      result
    end

    private

    def build_freq(array); end
  end
end
