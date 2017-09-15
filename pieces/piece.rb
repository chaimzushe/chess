class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    raise 'Invalid position' unless board.valid_pos?(pos)
    raise 'Invalid color' unless [:black, :white].include?(color)
    @board = board
    @pos = pos
    @color = color
    board.add_piece(self, pos)
  end

  def to_s
    " #{symbol} "
  end


  def empty?
    self.is_a?(NullPiece) ? true : false
  end

  def symbol

  end

  def valid_moves
    moves.reject { |move| board.test_check(pos, move)}
  end


end
