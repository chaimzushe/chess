require_relative 'piece.rb'
class Knight < Piece
  def initialize(pos, board, color)
    super
    @symbol = "♘".colorize(color)
  end

end
