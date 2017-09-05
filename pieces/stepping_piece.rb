module SteppingPiece



  def moves
    move_diffs.each_with_object([]) do |(dx, dy), moves|
      cur_x, cur_y = @pos
      new_move = [cur_x + dx, cur_y + dy]
      next unless board.valid_pos?(new_move)
      if board.empty?(new_move)
        moves << new_move
      else
        moves << new_move if board[new_move].color != self.color
      end
    end
  end



end
