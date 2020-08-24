# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../break_camel_case/break_camel_case'

class TestBreakCamelCase < Minitest::Test
  def test_breaks_camel_cased_string_v1
    input = 'camelCase'
    output = 'camel Case'

    assert_equal CamelCaseBreaker.call(input), output
  end

  def test_breaks_camel_cased_string_v2
    input = 'camelCasingTest'
    output = 'camel Casing Test'

    assert_equal CamelCaseBreaker.call(input), output
  end

  def test_does_not_break_pascal_case
    input = 'PascalCase'
    output = input

    assert_equal CamelCaseBreaker.call(input), output
  end

  def test_does_not_break_snake_case
    input = 'snake_case'
    output = input

    assert_equal CamelCaseBreaker.call(input), output
  end

  def test_does_not_break_kebab_case
    input = 'kebab-case'
    output = input

    assert_equal CamelCaseBreaker.call(input), output
  end
end
