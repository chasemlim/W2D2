require_relative 'piece'

class Bishop < Piece
  
  include Slideable
  
  attr_reader :type, :pos, :board, :color
  
  def initialize(color, board, pos)
    super
    @type = :bishop
  end
  
  def to_s
    if @color == "white"
      " ♗ "
    else
      " ♝ "
    end
  end
  
end