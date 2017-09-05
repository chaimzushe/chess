require_relative 'piece.rb'
require_relative 'sliding_piece.rb'


class Queen < Piece
  include SlidingPiece

  def symbol
    "♕".colorize(color)
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end
