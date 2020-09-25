# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../same/same'

class TestSame < Minitest::Test
  def test_returns_true
    array_1 = [1, 2, 3]
    array_2 = [4, 1, 9]

    assert Same.call_frequency(array_1, array_2)
  end

  def test_return_false_when_one_array_is_short_than_the_other
    array_1 = [1, 2, 3]
    array_2 = [1, 9]

    result = Same.call_frequency(array_1, array_2)

    assert result == false
  end

  def test_false_when_array_does_not_match_frequency
    array_1 = [1, 2, 1]
    array_2 = [4, 4, 1]

    Same.call_frequency(array_1, array_2) do |_, _, result|
      assert(result == false)
    end
  end
end
