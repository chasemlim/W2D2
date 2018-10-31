require_relative 'piece'

class Bishop < Piece
  
  include Slideable
  
  attr_reader :type
    attr_accessor :color, :board, :pos
  
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