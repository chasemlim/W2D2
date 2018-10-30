require_relative 'piece'
require_relative 'nullpiece'

class Board
  
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    fill_board
  end
  
  def fill_board
    @grid[0..7].each.with_index do |row, idx|
      if idx.zero? || idx == 1 || idx == 6 || idx == 7
        row.each_with_index do |col, idx2|
          self[[idx, idx2]] = Piece.new("white", self, [idx, idx2])
        end
      else
        row.each_with_index do |col, idx2|
          self[[idx, idx2]] = NullPiece.instance # make singleton NullPiece object
        end
      end
    end
    @grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
  
  def move_piece(start_pos, end_pos)
    s = start_pos
    e = end_pos
    if self[s].is_a?(NullPiece)
      raise NullPieceError
    elsif !valid_pos?(e)
      raise OutOfBoundsError
    else
      piece = self[s]
      self[s] = NullPiece.new
      self[e] = piece
    end
  end
  
  def valid_pos?(pos)
    return false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end
  
end


class NullPieceError < StandardError
  def message
    "No available piece here! Try again."
  end
end

class OutOfBoundsError < StandardError
  def message
    "Invalid space! Try again."
  end
end