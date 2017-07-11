module SlidingPiece

  DIAGONAL_MOVES = [
    [-1, -1], # up-left
    [-1, 1], # up-right
    [1, 1], # down-right
    [1, -1] # down-left
  ]

  STRAIGHT_MOVES = [
    [-1, 0], # up
    [0, 1], # right
    [1, 0], # down
    [0, -1] # left
  ]

  ALL_MOVES = DIAGONAL_MOVES + STRAIGHT_MOVES
  private

  def grow_unblocked_moves_in_dir(dir)
    dx, dy = dir
    moves = []

    temp_pos = self.pos
    while true
      temp_pos = [(temp_pos[0] + dx), (temp_pos[1] + dy)]
      break unless self.board.in_bounds?(temp_pos)
      moves << temp_pos
    end

    moves
  end

  def moves_to(directions)
    valid_moves = []
    directions.each do |dir|
      valid_moves += grow_unblocked_moves_in_dir(dir)
    end
    valid_moves
  end



  def horizontal_dirs
    moves_to(STRAIGHT_MOVES)
  end

  def diagonal_dirs
    moves_to(DIAGONAL_MOVES)
  end



end
