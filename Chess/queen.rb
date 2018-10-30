require_relative 'piece'

class Queen < Piece
  include Slideable
  
  attr_reader :type, :pos, :board, :color
  
  def initialize(color, board, pos)
    super
    @type = :queen
  end
  
  def to_s
    if @color == "white"
      " ♕ "
    else
      " ♛ "
    end
  end
end