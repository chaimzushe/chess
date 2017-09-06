# chess

Have endless fun, playing against a friend the *all time classic* game of chess.

written for the command line



<img width="1259" alt="gchess_image" src="https://user-images.githubusercontent.com/20543351/30088684-ebac556c-9275-11e7-8529-cb7d7f006a7d.png">



### Installation

- download zip or `git clone` `https://github.com/chaimzushe/chess.git` `bundle install`



### how to play

- navigate to the files root durectory, run `ruby chess.rb` to begin th game.
- use the arrow keys or w s a d to move the cursor.
- space or enter to select or drop a playing piece.


### Features
- When Selecting a piece to move all valid available moves for that piece will be displayed in color a varient color. this was acheived be
by redrawing the board for every piece to filter out only legal moves. 

### Implementation


- Uses modules to extract methods common to several types of pieces and keep the code DRY. 
i.e. queen, rook and bishop include the slidable module while knight and king include the stepping module.

```
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
  ```
