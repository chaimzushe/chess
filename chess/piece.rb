require_relative 'board.rb'

class Piece
  attr_accessor :pos, :board, :symbol, :color


  def initialize(pos, board, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = nil
  end

  def to_s
    self.symbol.to_s
  end

  def moves
   #leave for subclasses to implement!
  end
end
