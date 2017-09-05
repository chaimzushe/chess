require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece


  def symbol
      color == :black ? "\u265D" : "\u2657"
  end

  def move_dirs
    diagonal_dirs
  end

end
