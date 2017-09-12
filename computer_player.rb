require_relative 'display.rb'
require_relative 'player'
require 'byebug'

class ComputerPlayer < Player

  def random_moves(board)
    randoms = []
    all_my_pieces = board.pieces.select{|p| p.color == self.color }
    all_my_pieces.each do |piece|
      start_pos = piece.pos
      piece.valid_moves.each do |end_pos|
        randoms << [start_pos, end_pos]
      end
    end

    randoms
  end

  def make_move(board)
    random_moves(board).sample
  end

end
