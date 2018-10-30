require_relative 'piece'

class Knight < Piece
  include Stepable
  
  attr_reader :type, :pos, :board, :color
  
  def initialize(color, board, pos)
    super
    @type = :knight
  end
  
  def to_s
    if @color == "white"
      " ♘ "
    else
      " ♞ "
    end
  end
end