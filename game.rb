require_relative 'board'
require_relative 'piece'


def int_check(s_input)
  (s_input == '0') || (s_input.to_i != 0)
end

def str_to_int_arr(array)
  array.map do |str|
    if int_check(str)
      if str.to_i >= 0 && str.to_i <= 2
        str.to_i
      else
        return nil
      end
    else
      puts 'The array contains values that are not integers!'
      return nil
    end
  end
end

def proper_piece(inp_cord, piece_type)
  if !inp_cord.index(',').nil? && inp_cord.length == 3 && !str_to_int_arr(inp_cord.split(',')).nil?
    x_y_coor = str_to_int_arr(inp_cord.split(','))
    Piece.new(x_y_coor[0], x_y_coor[1], piece_type)
  else 
    puts 'Invalid input. Please enter proper coordinates!'
  end
end

def does_piece_exist?(grid, piece)
  grid.piece_coor.any? do |curr|
    curr == [piece.x_pos, piece.y_pos, 'X'] || 
      curr == [piece.x_pos, piece.y_pos, 'O']
  end
end

def main(grid, piece_type)
  until grid.is_game_over?
    piece = proper_piece(gets.chomp, piece_type)
    if !piece.nil?
      exists_alrd = does_piece_exist?(grid, piece)
      if !exists_alrd
          grid.add_new_piece(piece)
          grid.num_of_pieces += 1
          unless grid.is_game_over?
            puts "Next player's turn!"
          end
          if piece.type == "O"
            piece_type = 'X'
          else
            piece_type = "O"
          end
      else
        puts 'There is already a piece there!'
      end
    end
  end
end

puts 'Welcome to tic-tac-toe. This is a two player game. Grab your friends or 
family and press "1" to begin playing! Enjoy.'
inp = gets.chomp
if inp != '1' && inp != '2'
  puts 'You did not enter one of the two options!'
elsif inp == "1"
  puts 'Would the player that goes first like to be "X" or "O"?'
  x_or_o = gets.chomp
  if x_or_o.casecmp('X').zero? || x_or_o.casecmp('O').zero?
    puts "Awesome! Here's the board:" 
    board = Board.new
    puts "[0,0] is the top left corner and [2,2] is the bottom right. Please enter the 
    coordinates like \"x,y\" (without the brackets!)."
    main(board, x_or_o.upcase)
  else
    puts "That's not an option!"
  end
end