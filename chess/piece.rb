require_relative 'board.rb'

class Piece
  attr_accessor :pos, :board, :symbol


  def initialize(pos, board)
    @board = board
    @pos = pos
    @symbol = nil
  end

  def to_s
    self.value.to_s
  end

  def moves
   #leave for subclasses to implement!
  end
end







class NullPiece
  def initialize(pos, board)
    super
  end
end
#
# class Bishop < Piece
#   #include SlidingPiece
#   DIAGONAL_MOVES = [
#     [-1, -1], # up-left
#     [-1, 1],# up-right
#     [1, 1], # down-right
#     [1, -1] # down-left
#   ]
#
#   def initialize(pos, board)
#     super
#     @symbol = "♝"
#   end
#
#   def grow_unblocked_moves_in_dir(dir)
#     dx, dy = dir
#     moves = []
#
#     temp_pos = self.pos
#     while true
#       break unless self.board.in_bounds?(temp_pos)
#       temp_pos = [(temp_pos[0] + dx), (temp_pos[1] + dy)]
#       moves << temp_pos
#     end
#
#     moves
#   end
#
#   def moves
#     valid_moves = []
#     DIAGONAL_MOVES.each do |dir|
#       valid_moves << grow_unblocked_moves_in_dir(dir)
#     end
#     valid_moves
#   end
#
# end
