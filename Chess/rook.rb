require_relative 'piece'

class Rook < Piece
  include Slideable
  
  attr_reader :type, :pos, :board
  
  def initialize(color, board, pos)
    super
    @type = :rook
  end
  
  def to_s
    if @color == "white"
      "♖"
    else
      "♜"
    end
  end
end