require_relative 'piece.rb'
class NullPiece < Piece
  def initialize(pos, board, color)
    super
    @symbol = " "
  end
end
