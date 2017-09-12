require_relative 'piece.rb'
require_relative 'sliding_piece.rb'


class Queen < Piece
  include SlidingPiece

  def symbol
      color == :black ?  "\u265B" : "\u2655"
  end

  def value
    90
  end


  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end
