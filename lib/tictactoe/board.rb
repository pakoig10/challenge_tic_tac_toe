# frozen_string_literal: true

module TicTacToe
  class Board
    attr_accessor :board_dimensions
    :dimensions
    def initialize(board_dimensions, dimensions)
      @board_dimensions = board_dimensions
      @dimensions = dimensions
    end

    def self.insert_dimensions
      board_dimensions = 0
      while board_dimensions < 3
        print 'Choose the size of the board: '
        board_dimensions = gets.chomp.to_i
        return board_dimensions if board_dimensions >= 3
      end
      board_dimensions
    end

    def self.print_board(board_dimensions, dimensions)
      row = 0
      while row < 3
        print ' ', "\n"
        ((board_dimensions * row)...((row + 1) * board_dimensions)).each do |index|
          print "|#{dimensions[index]}|"
        end
        row += 1
      end
      print "\n"
    end
  end
end
