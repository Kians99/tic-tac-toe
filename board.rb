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
    @is_piece_on_board = Array.new(3) { Array.new(3, 0) }
    @piece_coor = Array.new(0) 
  end

  attr_reader :piece_coor, :is_piece_on_board

  def add_new_piece(piece)
    self.is_piece_on_board[piece.x_pos][piece.y_pos] = 1
    self.piece_coor.push([piece.x_pos, piece.y_pos, piece.type])
    print_board(piece.type)
  end

  def in_a_row?
    game_over = false
    self.is_piece_on_board.each do |rows|
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

  def in_a_column?
    game_over = false
    self.is_piece_on_board.each do |rows|
      count = 0
      row[0]
  end


  def is_game_over?
    in_a_row?
  end
  
  def print_board(string_rep)
    board = ""
    board += "\n"
      for i in 0..2
        for j in 0..2
          if piece_coor.include?([i,j,"X"])
              board += " |" + "X" + "| "
          elsif piece_coor.include?([i,j,"O"])
            board += " |" + "O" + "| "
          else
            board += " |" + " " + "| " 
          end
        end
        board += "\n" + "\n"
      end
    puts(board)
  end
end
