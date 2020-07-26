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
        puts 'The coordinates are not in range'
        return nil
      end
    else
      puts 'The array contains values that are not integers!'
      return nil
    end
  end
end

def main(game_mode, grid)
  until grid.is_game_over?
    pos = gets.chomp 
    if !pos.index(',').nil? && pos.length == 3 && !str_to_int_arr(pos.split(',')).nil?
      x_y_coor = str_to_int_arr(pos.split(','))
      piece = Piece.new(x_y_coor[0], x_y_coor[1], 'X')
      grid.add_new_piece(piece)
    else
      puts 'Invalid input. Please enter proper coordinates!'
    end
  end
end

puts 'Welcome to tic-tac-toe! If you would like to play with two players
please type "1". If you would like to play against the computer
please type "2".'
inp = gets.chomp
if inp != '1' && inp != '2'
  puts 'You did not enter one of the two options!'
elsif inp == "1"
  puts 'Great! Have fun, here is the board: '
  board = Board.new
  puts "Player one goes first. [0,0] is the top left corner 
  and [2,2] is the bottom right. Please enter the coordinates like: \"x,y\"."
  main(1, board)
#else 
#  puts "Great! Have fun, here is the board: "
 # board = Board.new
 # puts "The human player goes first. [0,0] is the buttom left corner 
#  and [2,2] is the top right. Please enter the coordinates like: \"x,y\"."  
end
