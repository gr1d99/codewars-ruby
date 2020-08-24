# frozen_string_literal: true

module CamelCaseBreaker
  class << self
    def call(input)
      return input unless input

      return input unless downcase?(input[0])

      return input if input.include?('_') || input.include?('-')

      input.split(/(?=[A-Z])/).join(' ')
    end

    private

    def downcase?(char)
      char.downcase == char
    end
  end
end
