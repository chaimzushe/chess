require_relative 'display.rb'
require_relative 'player'
require 'byebug'

class ComputerPlayer < Player

  def make_move(board)
      display.render

      move = board.minimax_root(2, true)
      move
  end





end
