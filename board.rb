class Board
  def initialize
    board = ""
    board += "\n"
    for i in 0..2
      for j in 0..2
        board += " | " + "| "
      end
      board += "\n" + "\n"
    end
    puts(board)
    @arr = Array.new(3) { Array.new(3, 0) }
    @game_over = false
  end

  attr_accessor :game_over

  def add_new_piece(piece)
    @arr[piece.x_pos][piece.y_pos] = 1
    print_board(piece)
  end


  def in_a_row?(game_over)
    @arr.each do |rows|
      count = 0
      rows.each do |pos|
        if pos == 1
          count += 1
        end
      end
      if count == 3
        game_over = true
      end
    end
      return game_over
  end


  def is_game_over?
    game_over = false
    in_a_row?(game_over)
  end
  
  def print_board(string_rep)
    board = ""
    board += "\n"
    for i in 0..2
      for j in 0..2
        if i == string_rep.x_pos && j == string_rep.y_pos 
          board += " |" + string_rep.type + "| "
        else
          board += " |" + " " + "| "
        end
      end
      board += "\n" + "\n"
    end
    puts(board)
  end
end
