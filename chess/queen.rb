require_relative 'piece.rb'
class Queen < Piece
  def initialize(pos, board, color)
    super
    @symbol = "♕".colorize(color)
  end
end
