require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def symbol
    "♖".colorize(color)
  end

  def move_dirs
    horizontal_dirs
  end

end
