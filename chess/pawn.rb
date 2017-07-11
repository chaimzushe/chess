require_relative 'piece.rb'
class Pawn < Piece
  attr_reader :diff

  def initialize(pos, board, color)
    super
    @symbol = "♙".colorize(color)
    @diff = color == :black ? 1 : -1
  end



  def moves
    moves = []

    # if in starting position
    if (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6)
      moves += [ [self.pos[0] + diff * 2, self.pos[1]] ]
    end
    # if right side has enemy piece
    right = [self.pos[0] + diff, self.pos[1] + 1]
    if board[right].class !=  NullPiece && board[right].color != self.color
      moves += [right]
    end
    # if left side has enemy piece
    left = [self.pos[0] + diff, self.pos[1] - 1]
    if board[left].class !=  NullPiece &&  board[left].color != self.color
      moves += [left]
    end
    # standard move one square forward move
    forward = [self.pos[0] + diff, self.pos[1]]
    moves += [forward] if board.in_bounds?(forward)
     moves
  end

end
