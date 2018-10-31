require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @start_pos = nil
    @end_pos = nil
  end
  
  def display_board
    @board.grid.each_with_index do |row, row_idx|
      arr = row.map.with_index do |piece, col_idx| 
        if (row_idx.even? && col_idx.odd?) || (row_idx.odd? && col_idx.even?)
          if @cursor.cursor_pos == [row_idx, col_idx]
            piece.to_s.colorize(:background => :cyan)
          else
            piece.to_s.colorize(:background => :light_black)
          end
        else
          if @cursor.cursor_pos == [row_idx, col_idx]
            piece.to_s.colorize(:background => :cyan)
          else
            piece.to_s.colorize(:background => :light_white)
          end
        end
      end
      
      puts arr.join("")
    end
  end
  
  def render
    loop do 
      
      begin
      system "clear"
      display_board  
      get_positions
      rescue OOBError => e
        e.message
        retry
      rescue NullPieceError => n
        n.message
        retry
      rescue WrongMoveError => w
        w.message
        retry
      end
    end
  end
end

def get_positions
  pos = @cursor.get_input
  if pos != nil
    if @start_pos
      @end_pos = pos
    else
      @start_pos = pos
    end
    
    if @start_pos && @end_pos

      @board.move_piece(@start_pos, @end_pos)
      @start_pos = nil
      @end_pos = nil
    end
  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  d = Display.new(b)
  d.render
end