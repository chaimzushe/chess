require_relative 'piece.rb'
require_relative 'board.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece


  def initialize(pos, board, color)
    super
    @symbol = "♗".colorize(color)
  end

  def moves
    diagonal_dirs
  end

end
