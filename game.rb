require_relative 'board'

def int_check(s_input) 
  (s_input == "0") || (s_input.to_i != 0)
end

puts 'Welcome to tic-tac-toe! If you would like to play with two players
please type "1". If you would like to play against the computer
please type "2".'
inp = gets.chomp
if inp != "1" && inp != "2"
  puts "You did not enter one of the two options!"
else
  puts "Great! Have fun, here is the board: "
  Board.new
end


