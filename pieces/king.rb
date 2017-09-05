require_relative 'piece.rb'
require_relative 'stepping_piece.rb'


class King < Piece
  include SteppingPiece

  def symbol
    (color == :black) ? "\u265A" : "\u2654"
  end




  def move_diffs
    [
     [-1, -1],
     [-1, 1],
     [1, 1],
     [1, -1],
     [-1, 0],
     [0, 1],
     [1, 0],
     [0, -1]
   ]
  end

end
