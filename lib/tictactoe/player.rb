# frozen_string_literal: true

module TicTacToe
  attr_accessor :symbol
  attr_reader   :number
  class Player
    def initialize(symbol, number)
      @symbol = symbol
      @number = number
    end
  end
end
