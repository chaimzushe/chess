require_relative 'piece.rb'

class Rook < Piece
  def initialize(pos, board, color)
    super
    @symbol = "♖".colorize(color)
  end
end
