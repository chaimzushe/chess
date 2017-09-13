# chess

Have endless fun, playing a grand game of the all time classic **Chess**.

written for the command line


<img width="1259" alt="gchess_image" src="https://user-images.githubusercontent.com/20543351/30088684-ebac556c-9275-11e7-8529-cb7d7f006a7d.png">



### Installation

- download zip or `git clone` `https://github.com/chaimzushe/chess.git` `bundle install`



### how to play

- navigate to the files root directory, run `ruby chess.rb` to begin the game.
- use the arrow keys or 'w' 's' 'a' 'd' to move the cursor.
- space or enter to select or drop a playing piece.


### Features
- A modest ai. the computer calculates one move ahead to choose its best move.
- Available moves for a selected piece are  highlighted. This was achieved, by checking the position of the cursor, extracting the piece thats sitting in that position, and fetching all its possible moves.   

### Implementation


- Uses modules to extract methods common to several types of pieces. This helped keeping the code DRY.
i.e. the queen, rook, and bishop classes include the slidable module. The knight and king class include the stepping module.

- A point system. Achieved by writing a method that loops through the pieces on the board and assigning a score, based on each piece's value. subtracting points if its an opponents piece, and adding points if it's the current player's pieces.

```
def score(color)
  score = 0
  pieces.select{ |p| p.color == color}.each do |p|
    score += p.value;
  end

  pieces.reject{ |p| p.color == color}.each do |p|
    score -= p.value;
  end
  score
end


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

  best_value == 0 ? all_moves.sample : best_move
end
  ```
