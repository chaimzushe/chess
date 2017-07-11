require_relative 'piece.rb'
require_relative 'stepping_piece'


class Knight < Piece
  include SteppingPiece
  def initialize(pos, board, color)
    super
    @symbol = "♘".colorize(color)
  end

end
