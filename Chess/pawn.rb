require_relative 'piece'

class Pawn < Piece
    attr_accessor :color, :board, :pos
  
  def initialize(color, board, pos)
    super
  end
  
  def to_s
    if @color == "white"
      " ♙ "
    else
      " ♟ "
    end
  end
  
  def moves
    valid_moves = []
    
    if @color == "black"
      valid_moves << [@pos[0] + 2, @pos[1]] if @pos[0] == 1
      valid_moves << [@pos[0] + 1, @pos[1]]
    elsif @color == "white"
      valid_moves << [@pos[0] - 2, @pos[1]] if @pos[0] == 6
      valid_moves << [@pos[0] - 1, @pos[1]]
    end
    
    
  end
  
end