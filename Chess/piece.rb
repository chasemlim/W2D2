module Slideable
  LINEAR_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  
  def move_dirs
    moves_arr = []
    
    case self.type
    when :bishop
      moves_arr = DIAGONAL_DIRS
    when :rook
      moves_arr = LINEAR_DIRS
    when :queen
      moves_arr = DIAGONAL_DIRS + LINEAR_DIRS
    end
    moves_arr
  end
  
  def moves
    potential_moves = []
    move_dirs.each do |diff|
      current_pos = self.pos
      while self.board.valid_pos?([current_pos[0] + diff[0], current_pos[1] + diff[1]])
        current_pos = [current_pos[0] + diff[0], current_pos[1] + diff[1]]
        potential_moves << current_pos
      end
    end
    potential_moves
  end
end

module Stepable
  # king/knight
  
  def move_dirs
    moves_arr = []
    
    case self.type
    when :knight
       moves_arr = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    when :king
       moves_arr = [[-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]]
    end
    moves_arr
  end
  
  def moves
    potential_moves = []
    move_dirs.each do |diff|
      if self.board.valid_pos?([self.pos[0] + diff[0], self.pos[1] + diff[1]])
        potential_moves << [self.pos[0] + diff[0], self.pos[1] + diff[1]]
      end
    end
    potential_moves
  end
  
end

class Piece
  # attr_accessor
  # color = symbol, board = Board, pos = Array of row, col
  def initialize(color, board, pos)
    @color, @board, @pos = color, board, pos
  end
  
  def to_s
    "♙"
  end
  
  def moves
  end
end