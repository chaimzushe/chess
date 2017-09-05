require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece


  def symbol
    "♗".colorize(color)
  end

  def move_dirs
    diagonal_dirs
  end

end
