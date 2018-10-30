require 'singleton'

class NullPiece
  include Singleton
    
  attr_accessor :color, :symbol
  
  def initialize
    @color = nil
    @symbol = nil
  end
  
  def to_s
    "   "
  end
  
end