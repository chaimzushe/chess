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
    get_best_move(board)
  end

  def get_best_move(board)
    all_moves = random_moves(board)
    best_move = nil
    best_value = -99999
    all_moves.each do |move|
      board_value = move_strength(move, board)
      if board_value > best_value
        best_value = board_value
        best_move = move
      end
    end
    best_move
  end

  def move_strength(move, board)
    pos, end_move = move
    test_board = board.dup
    test_board.move_piece!(pos, end_move)
    test_board.score(self.color)
  end

end
