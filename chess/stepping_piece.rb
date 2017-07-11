module SteppingPiece

  KNIGHT =[
   [-2,1],
   [-1,2],
   [1, 2],
   [2, 1],
   [2,-1],
   [1,-2],
   [-1,-2],
   [-2,-1]
  ]


  KING = [
    [-1, -1], # up-left
    [-1, 1], # up-right
    [1, 1], # down-right
    [1, -1],# down-left
    [-1, 0], # up
    [0, 1], # right
    [1, 0], # down
    [0, -1] # left
  ]

  def moves
    if self.class == Knight
      move_diffs(KNIGHT)
    else
      move_diffs(KING)
    end
  end

  def move_diffs(diffs)
    moves = []
    temp_pos = self.pos
    diffs.each do |dif|
      dx, dy = dif
      temp_pos = [(self.pos[0] + dx), (self.pos[1] + dy)]
      moves << temp_pos if board.in_bounds?(temp_pos)
    end
    moves
  end

end
