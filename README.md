# chess

Have endless fun, playing the *all time classic* game of chess.

written for the command line



<img width="1259" alt="gchess_image" src="https://user-images.githubusercontent.com/20543351/30088684-ebac556c-9275-11e7-8529-cb7d7f006a7d.png">



### Installation

- download zip or `git clone` `https://github.com/chaimzushe/chess.git` `bundle install`



### how to play

- navigate to the files root directory, run `ruby chess.rb` to begin the game.
- use the arrow keys or w s a d to move the cursor.
- space or enter to select or drop a playing piece.


### Features
- A modest ai. the computer calculates one move to choose its best move.
- Move that are available highlighting. When Selecting a piece to move, all available moves for that specific piece will
  be highlighted in a brighter color. This was achieved, buy checking the position of the cursor, and the piece thats sitting in that position, and fetching all its possible moves.   

### Implementation


- Uses modules to extract methods common to several types of pieces and keep the code DRY.
i.e. queen, rook and bishop include the slidable module while knight and king include the stepping module.

- Loops through the boards pieces and calculates the score of the board based on each piece's value. subtracting points
if its an opponent and adding points if it's the players pieces.

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
