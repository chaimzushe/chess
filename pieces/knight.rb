require_relative 'piece.rb'
require_relative 'stepping_piece.rb'


class Knight < Piece
  include SteppingPiece

  def symbol
    color == :black ? "\u265E" : "\u2658"
  end







  def move_diffs

     [[-2,1],
     [-1,2],
     [1, 2],
     [2, 1],
     [2,-1],
     [1,-2],
     [-1,-2],
     [-2,-1]]

  end
end
