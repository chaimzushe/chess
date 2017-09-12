require_relative 'piece.rb'
require_relative 'stepping_piece.rb'
require 'byebug'



class King < Piece

  attr_reader :moved
  include SteppingPiece

  def symbol
    (color == :black) ? "\u265A" : "\u2654"
  end
  
  def value
    900
  end

  def moved
    @moved = true
  end


  def move_diffs
    moves = [
     [-1, -1],
     [-1, 1],
     [1, 1],
     [1, -1],
     [-1, 0],
     [0, 1],
     [1, 0],
     [0, -1]
   ]

    moves
  end

end
