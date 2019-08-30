# frozen_string_literal: true

def verify_fields(movements, board, player)
  verify = false
  while verify == false
    if board[movements.to_i] == ' '
      return movements
    elsif player == 1
      print 'Turn of the player ONE: '
      movements = gets.chomp
    elsif player == 2
      print 'Turn of the player TWO: '
      movements = gets.chomp
    end
  end
end

def insert_dimensions
  dim = 0
  while dim < 3
    print 'Choose the size of the board: '
    dim = gets.chomp.to_i
    print "\n"
  end
  dim
end
