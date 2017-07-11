class Pawn
  def initialize(pos, board, color)
    super
    @symbol = "♙".colorize(color)
  end
end
