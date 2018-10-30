require_relative 'reqpieces'
require 'byebug'

class Board
  
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    fill_board
  end
  
  def fill_board
    @grid[0..7].each.with_index do |row, idx|
      if idx.zero?
        self[[idx, 0]], self[[idx, 7]] = Rook.new("black", self, [idx, 0]), Rook.new("black", self, [idx, 7])
        self[[idx, 1]], self[[idx, 6]] = Knight.new("black", self, [idx, 1]), Knight.new("black", self, [idx, 6])
        self[[idx, 2]], self[[idx, 5]] = Bishop.new("black", self, [idx, 2]), Bishop.new("black", self, [idx, 5])
        self[[idx, 3]], self[[idx, 4]] = Queen.new("black", self, [idx, 3]), King.new("black", self, [idx, 4])
      elsif idx == 1
        row.each_with_index do |col, idx2|
          self[[idx, idx2]] = Pawn.new("black", self, [idx, idx2])
        end
      elsif idx == 6
        row.each_with_index do |col, idx2|
          self[[idx, idx2]] = Pawn.new("white", self, [idx, idx2])
        end
      elsif idx == 7
        self[[idx, 0]], self[[idx, 7]] = Rook.new("white", self, [idx, 0]), Rook.new("white", self, [idx, 7])
        self[[idx, 1]], self[[idx, 6]] = Knight.new("white", self, [idx, 1]), Knight.new("white", self, [idx, 6])
        self[[idx, 2]], self[[idx, 5]] = Bishop.new("white", self, [idx, 2]), Bishop.new("white", self, [idx, 5])
        self[[idx, 3]], self[[idx, 4]] = Queen.new("white", self, [idx, 3]), King.new("white", self, [idx, 4])
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
    elsif !self[s].moves.include?(e)
      raise WrongMoveError
    elsif !valid_pos?(e) # obsolete
      raise OutOfBoundsError
    else
      piece = self[s]
      self[s] = NullPiece.instance
      self[e] = piece
    end
  end
  
  def valid_pos?(pos)
    return false if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
    true
  end
  
  def in_check?(color)
    
  end
  
end


class NullPieceError < StandardError
  def message
    "No available piece here! Try again."
  end
end

class WrongMoveError < StandardError
  def message
    "You can't make this move, try again."
  end
end

class OutOfBoundsError < StandardError
  def message
    "Invalid space! Try again."
  end
end