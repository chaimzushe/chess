require_relative 'piece.rb'
require_relative 'stepping_piece.rb'
require_relative 'board.rb'

class King < Piece
  include SteppingPiece
  def initialize(pos, board, color)
    super
    @symbol = "♔".colorize(color)
  end

end
