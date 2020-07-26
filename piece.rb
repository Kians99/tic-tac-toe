class Piece

  @@num_of_pieces = 0

  attr_accessor :x_pos, :y_pos, :type
  
  def initialize(x_pos, y_pos, type)
    @x_pos = x_pos
    @y_pos = y_pos
    @type = type
    @@num_of_pieces += 1
  end

  def self.number_of_pieces
    @@num_of_pieces
  end
end