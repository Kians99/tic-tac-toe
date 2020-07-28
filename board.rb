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
    @piece_coor = Array.new(0)
    @read_out = 0
    @num_of_pieces = 0
  end

  attr_reader :piece_coor
  attr_accessor :read_out, :num_of_pieces

  def add_new_piece(piece)
    self.piece_coor.push([piece.x_pos, piece.y_pos, piece.type]) 
    print_board(piece.type)
  end

  def three_pieces_in_row(row_col_num)
    count_x = 0
    count_o = 0
    for i in 0..1
      0.upto(row_col_num - 1) do |num|
        self.piece_coor.each do |rows|
          if rows[i] == num && rows[2] == "X" 
            count_x += 1
          elsif rows[i] == num && rows[2] == "O"
            count_o += 1
          end
        end
        if count_x == 3
          return [i, num, "X"]
        elsif count_o == 3
          return [i, num, "O"]
        else
          count_x = 0
          count_o = 0
        end
      end
    end
    return -1
  end

  def diagonal_l_game_over
    count_x = 0
    count_o = 0
    for i in 0..self.piece_coor.length - 1
      for j in 0..2 
        
        if piece_coor[i][0] == j && piece_coor[i][1] == j && piece_coor[i][2] == "X"
          count_x += 1
        elsif piece_coor[i][0] == j && piece_coor[i][1] == j && piece_coor[i][2] == "O"
          count_o += 1
        end
      end
      if count_x == 3
        return "X"
      elsif count_o == 3
        return "O"
      end
    end
    return -1
  end

  def diagonal_r_game_over
    count_x = 0
    count_o = 0
    check = [[0,2], [2,0], [1,1]]
    check.each do |x_y| 
      self.piece_coor.each do |coords|
        if coords[0] == x_y[0] && coords[1] == x_y[1] && coords[2] == "X"
          count_x += 1
        elsif coords[0] == x_y[0] && coords[1] == x_y[1] && coords[2] == "O"
          count_o += 1
        end
        if count_x == 3
          return "X"
        elsif count_o == 3
          return "O"
        end
      end
    end
    return -1
  end

  def is_game_over?
    if self.read_out == 1
      return true
    end

    diag = self.diagonal_l_game_over
    diag_2 = self.diagonal_r_game_over
    match = three_pieces_in_row(3)

    if diag != -1
      puts "Game over! #{diag} wins diagonally!"
      self.read_out = 1
      true
    elsif diag_2 != -1
      puts "Game over! #{diag_2} wins diagonally!"
      self.read_out = 1
      true
    elsif match != -1
      if match[0] == 0 
        puts "Game over! #{match[2]} wins with a triad in row #{match[1] + 1}!"
      else
        puts "Game over! #{match[2]} wins with a triad in column #{match[1] + 1}!"
      end
        self.read_out = 1
        true
    elsif self.num_of_pieces == 9
      puts "It's a tie!"
      self.read_out = 1
      true
    else
      false 
    end  
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
