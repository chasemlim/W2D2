require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    loop do 
      
      begin
      system "clear"
      
      emoji = "♙"
      
      @board.grid.each_with_index do |row, row_idx|
        arr = row.map.with_index do |piece, col_idx| 

          if piece.is_a?(NullPiece) && @cursor.cursor_pos == [row_idx, col_idx]
            " ".colorize( :background => :cyan)
          elsif piece.is_a?(NullPiece) && @cursor.cursor_pos != [row_idx, col_idx]
            " "
          elsif piece.is_a?(Piece) && @cursor.cursor_pos == [row_idx, col_idx]
            emoji.colorize( :background => :cyan)
          elsif piece.is_a?(Piece) && @cursor.cursor_pos != [row_idx, col_idx]
            emoji
          end
        end
        
        puts arr.join(" ")
      end
      
        @cursor.get_input
      rescue OOBError => e
        e.message
        retry
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  d = Display.new(b)
  d.render
end