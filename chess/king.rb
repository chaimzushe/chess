require_relative 'piece.rb'
class King < Piece
  def initialize(pos, board, color)
    super
    @symbol = "♔".colorize(color)
  end
end
