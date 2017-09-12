require_relative 'piece.rb'
require 'byebug'
class Pawn < Piece
  attr_reader :diff

  def symbol
    color == :black ? "\u265F"  : "\u2659"
  end

  def value
    10
  end


  def moves
    forward + side_attack
  end

  private
  def start_line?
    (pos[0] == 6 && color == :white) || (pos[0] == 1 && color == :black)
  end

  def forward_direction
      (color == :white) ?  -1 : 1
  end

  def forward
    x , y = pos
    move_up_one = [x + forward_direction, y]
    unless board.valid_pos?(move_up_one) && board.empty?(move_up_one)
        return []
    end
    steps = [move_up_one]
    move_up_two = [x + 2 * forward_direction, y]
    if(start_line? && board.empty?(move_up_two))

      steps << move_up_two
    end

    steps
  end

  def side_attack
    x, y  = pos
    moves = []
    side_moves = [  # adding all possible side attack possitions
        [(x + forward_direction), (y -1)],
        [(x + forward_direction), (y +1)]
      ]
    side_moves.select do |move| #filter out only legit side attacks
      next false unless board.valid_pos?(move) # not on the board
      next false if board.empty?(move) ## no piece to threaten
      threatened_piece = board[move]
      threatened_piece && threatened_piece.color != self.color # only if its opposite color
    end
  end
end
