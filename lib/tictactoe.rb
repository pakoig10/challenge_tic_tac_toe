# frozen_string_literal: true

require './tictactoe/version'
require './tictactoe/board'
require './tictactoe/game'
require './tictactoe/player'
require './tictactoe/verify_dim'

puts "
Tic Tac Toe Game! \n
Rules:\n
-The first time that start the game, will begin the player X.
-Win the first player in doing a combination (Horizontal, Vertical or Diagonal).
-If you want to play again, will began the loser player.
-If it's a draw, will begin the penultimate player in choose a field
-You can't choose a occupied field. \n

And the most important -HAVE FUN!-\n\n"

player_x = 'x'
player_o = 'o'
play_again = ''

while play_again != '' || play_again != 'Y'
  play_again = ''
  game = TicTacToe::Game.new(0, 'undefined', player_x, player_o)
  game.init_game
  player_o = if player_x == 'o' 'x' else 'o' end
end
play_again = TicTacToe::Game.try_again(no_play_again)
