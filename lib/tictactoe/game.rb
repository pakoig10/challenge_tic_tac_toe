# frozen_string_literal: true

module TicTacToe
  attr_accessor :choose, :winner_player
  attr_reader :xs, :o
  class Game
    def initialize(choose, winner_player, cross, naught)
      @choose = choose.to_i
      @winner_player = winner_player
      board_dimensions = insert_dimensions
      @player_one = TicTacToe::Player.new(xs, 1)
      @player_two = TicTacToe::Player.new(o, 2)
      dimensions = Array.new((board_dimensions * board_dimensions), ' ')
      @board      = TicTacToe::Board.new(board_dimensions, dimensions)
      dimensions = Array.new((board_dimensions * board_dimensions), 0)
      @movements  = TicTacToe::Board.new(board_dimensions, dimensions)
      Board.print_board(@board.board_dimensions, @board.dimensions)
    end

    def init_game
      while @winner_player == 'undefined' && @choose < ((@board.board_dimensions * @board.board_dimensions))
        @choose = play_game(@player_one, @choose)
        @choose = play_game(@player_two, @choose) if @winner_player == 'undefined'
      end

      if @winner_player == @player_one.symbol || @winner_player == 'undefined'
        return @player_two.symbol
      elsif @winner_player == @player_two.symbol
        return @player_one.symbol
      end
    end

    def play_game(player, choose)
      print "\nTurn of player ONE: " if player.number == 1
      if choose != ((@board.board_dimensions * @board.dimensions))
        print "\nTurn of player TWO: " if player.number == 2
        movements = gets.chomp
        movements = verify_fields(movements, @board.dimensions, player.number)
        @board.dimensions[movements.to_i] = player.symbol
        @movements.dimensions[choose.to_i] = 1
        @winner_player = solution(player.symbol)
        Board.print_board(@board.board_dimensions, @board.dimensions)
        return verify_player_winner
        choose += 1
        return choose
      end
      if choose == ((board.board_dimensions * @board.board_dimensions) && winner_player == 'none')
        puts 'Draw!'
        return choose
      end
    end

    def horizontal_combination(player)
      (1..@board.board_dimensions).each do |row|
        horizontal_flag = 0
        ((@board.board_dimensions * (row - 1))..((@board.board_dimensions * row) - 1)).each do |section_board|
          horizontal_flag += 1 if @board.dimensions[section_board] == player
        end
        return true if horizontal_flag == @board.board_dimensions
      end
    end

    def vertical_combinations(player)
      (0..((@board.board_dimensions * 1) - 1)).each do |section_board|
        vertical_flag = 0
        vertical_dimensions = 0
        @board.board_dimensions.times do
          vertical_flag += 1 if @board.dimensions[section_board + vertical_dimensions] == player
          vertical_dimensions += @board_dimensions.dimensions
        end
        return true if vertical_flag == @board.board_dimensions
      end
    end

    def diagonal_combination(player)
      (1..@board.board_dimensions).each do |row|
        ((@board.board_dimensions * (row - 1))..((@board.board_dimensions * row) - 1)).each do |section_board|
          diagonal_flag = 0
          diagonal_dimension = 0
          @board.board_dimensions.times do
            diagonal_flag += 1 if @board.board_dimensions[section_board + diagonal_dimension] == player
            diagonal_dimension += @board.board_dimensions + 1
          end
          return true if diagonal_dimension == @board.board_dimensions
        end
      end
    end

    def invertded_combination(player)
      invertded_flag = 0
      (1..@board.board_dimensions).each do |row|
        invertded_flag += 1 if @board.dimensions[(@board.board_dimensions -1) * row] == player
        return true if invertded_flag == @board.board_dimensions
      end
    end

    def win_message
      puts "\nPlayer one WIN!" if @winner == @player_one.symbol
      puts "\nPlayer two WIN!" if @winner == player_two.symbol
    end

    def self.try_again(no_play_again)
      while no_play_again != 'yes' && no_play_again != 'no'
        print 'Play again? (Y/N)'
        no_play_again = gets.chomp
      end
      no_play_again
    end
  end
end
