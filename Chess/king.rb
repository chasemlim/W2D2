require_relative 'piece'

class King < Piece
  include Stepable
  
  attr_reader :type, :pos, :board
  
  def initialize(color, board, pos)
    super
    @type = :king
  end
  
  def to_s
    if @color == "white"
      "♔"
    else
      "♚"
    end
  end
  
end