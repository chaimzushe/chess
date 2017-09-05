module SlidingPiece

  DIAGONAL_MOVES = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ]

  HORIZANTEL_MOVES = [
    [-1, 0],
    [0, 1],
    [1, 0],
    [0, -1]
  ]

  def diagonal_dirs
    DIAGONAL_MOVES
  end

  def horizontal_dirs
    HORIZANTEL_MOVES
  end

  def moves
    moves = []
    move_dirs.each do | dx, dy |
      moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
  
    moves
  end

  private
  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx, dy)

    cur_x, cur_y = @pos
    moves = []
    while true
      cur_x, cur_y = cur_x + dx, cur_y + dy
      new_move = [cur_x, cur_y]
      break unless board.valid_pos?(new_move)
      if(board.empty?(new_move))
        moves << new_move
      else
        moves << new_move if board[new_move].color != self.color
        break
      end
    end
    moves
  end

end
