require_relative 'piece'

class Knight < Piece
  include Stepable
  
  attr_reader :type
    attr_accessor :color, :board, :pos
  
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