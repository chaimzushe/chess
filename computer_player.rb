require_relative 'display.rb'
require_relative 'player'
require 'byebug'

class ComputerPlayer < Player



  def make_move(board)
    piece = board.pieces.select{|p| p.color == self.color }.sample
    start_pos = piece.pos
    end_pos = piece.valid_moves.sample
    [start_pos, end_pos]
  end

end
