# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../anagram/anagram'

class TestAnagram < Minitest::Test
  def test_returns_true_for_empty_strings
    str_1 = ''
    str_2 = ''

    result = Anagram.call(str_1, str_2)

    assert result
  end

  def test_returns_true_for_anagram_strings
    str_1 = 'anagram'
    str_2 = 'nagaram'

    Anagram.call(str_1, str_2) do |result|
      assert(result)
    end
  end

  def test_return_false
    str_1 = 'aaz'
    str_2 = 'zza'

    result = Anagram.call(str_1, str_2)

    assert result == false
  end

  def test_returns_false_when_one_string_is_shorter
    str_1 = 'awesome'
    str_2 = 'awesom'

    result = Anagram.call(str_1, str_2)

    assert !result
  end
end
