require_relative 'pieces'
require 'byebug'

class Board

  attr_reader :board, :empty_spot

  def initialize(populate_borad=true)
    @empty_spot = NullPiece.instance
    make_starting_grid(populate_borad)
  end



  def [](pos)
    raise 'Invalid position' unless valid_pos?(pos)
    x, y = pos
    self.board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    self.board[x][y] = value
  end

  def add_piece(piece, pos)
    raise 'Invalid position' unless valid_pos?(pos)
    self[pos] = piece
  end

  def dup
    new_board = Board.new(false)
    pieces.each do |piece|
      piece.class.new(piece.pos , new_board, piece.color)
    end
    new_board
  end

  def pieces
    @board.flatten.reject{|piece| piece.empty? }
  end


  def move_piece(players_color, start_pos, end_pos)

    raise "Start position is not valid" if self.empty?(start_pos)
    piece = self[start_pos]
    raise "You can only move your color" if piece.color != players_color
    raise "Piece can not move there" unless piece.moves.include?(end_pos)
    raise "No moving into check" unless piece.valid_moves.include?(end_pos)
    move_piece!(start_pos, end_pos)
  end

  def move_piece!(pos, to_pos)
    piece = self[pos]

    raise "Not valid move" unless piece.moves.include?(to_pos)
    self[to_pos] = piece
    self[pos] = empty_spot
    piece.pos = to_pos
    if piece.class == King || piece.class == Rook
      piece.moved
    end
    nil
  end

  def empty?(pos)
    self[pos].empty?
  end



  def valid_pos?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

   def in_check?(color)
     kings_pos = find_king(color).pos
     pieces.any? do |piece|
       piece.color != color && piece.moves.include?(kings_pos)
     end
   end

   def check_mate?(color)
     return false unless self.in_check?(color)
     pieces.select { |piece| piece.color == color}.all? do |piece|
       piece.valid_moves.empty?
     end
   end

   def test_check(pos, move)
     piece = self[pos]
     piece_before =  self[move]
     self[move] = piece
     checked = self.in_check?(piece.color)
     self[pos] = piece
     self[move] = piece_before
     checked
   end



   def fill_pawns(color)
     x = (color == :white) ? 6 : 1
     8.times { |y| Pawn.new([x,y], self, color)}
   end

   def fill_first_row(color)
     front_pieces = [Rook, Knight,
                     Bishop, Queen,
                     King, Bishop,
                     Knight, Rook]

      x = (color == :white) ? 7 : 0
      front_pieces.each_with_index do |piece, y|
        piece.new([x, y], self, color)
      end
   end

   def find_king(color)
     king_pos = pieces.find {|piece| piece.color == color && piece.is_a?(King)}
     king_pos || (raise "King not found")
   end

   def make_starting_grid(populate_borad)
     @board = Array.new(8) {Array.new(8, empty_spot)}
     return unless populate_borad
     [:white, :black].each do |color|
       fill_pawns(color)
       fill_first_row(color)
     end
   end
   def minimax_root(depth, isMaximisingPlayer)

    best_score = -9999
    best_move_found = nil
    best_piece = nil

    self.pieces.select{|p| p.color == :black }.each do |piece|
      piece.valid_moves.each do |to_pos|
        origianl_pos = piece.pos # save original position of piece
        piece_in_spot_before = self[to_pos]# keep track of piece befoore atacked, to retrieve
        self[to_pos] = piece # move piece to next position
        self[origianl_pos] = empty_spot # empty out the space the piece was in originaly
        piece.pos = to_pos # update the piece's position for the piece to know. why not?
        value = minimax(depth - 1, !isMaximisingPlayer); # recursive call
        self[origianl_pos] = piece # move piece back to original spot
        piece.pos =  origianl_pos # upadte the piece to know he was mov ed back
        self[to_pos] = piece_in_spot_before  # bring back that piece that was there before
        piece_in_spot_before.pos = to_pos # update his position. ? - maybe not needed.
        if value >= best_score
          best_piece = piece
          best_score = value;
          best_move_found = to_pos

        end
      end
    end

    [best_piece.pos, best_move_found]
  end

  def test_move(pos, end_pos)

  end

  def test_redo(pos, end_pos)

  end

  def minimax(depth, isMaximisingPlayer)
    return score if depth == 0
    if isMaximisingPlayer
      best_score = -9999;
      pieces.select{|p| p.color == :black }.each do |piece|
        piece.valid_moves.each do |to_pos|

          origianl_pos = piece.pos
          piece_in_spot_before = self[to_pos]
          self[to_pos] = piece
          self[origianl_pos] = empty_spot
          piece.pos = to_pos
          best_score = [best_score, minimax(depth - 1, !isMaximisingPlayer)].max;
          self[origianl_pos] = piece
          piece.pos = origianl_pos
          self[to_pos] = piece_in_spot_before
          piece_in_spot_before.pos = to_pos
        end
      end
      return best_score
    else
      best_score = 9999;
      pieces.reject{|p| p.color == :white }.each do |piece|
        piece.valid_moves.each do |to_pos|
          origianl_pos = piece.pos
          piece_in_spot_before = self[to_pos]
          self[to_pos] = piece
          self[origianl_pos] = empty_spot
          piece.pos = to_pos
          best_score = [best_score, minimax(depth - 1, !isMaximisingPlayer)].min;
          self[origianl_pos] = piece
          piece.pos = origianl_pos
          self[to_pos] = piece_in_spot_before
          piece_in_spot_before.pos = to_pos
        end
      end
      return best_score
    end
  end


  def score
    score = 0;
    score = self.pieces.select{|p| p.color == :black}.reduce(0){|acc, p| acc + p.value }
    score -= self.pieces.reject{|p| p.color == :black}.reduce(0){|acc, p| acc + p.value }
    score
  end

  def test_check(pos, to_pos)
    piece = self[pos]
    piece_in_spot_before = (self[to_pos].value == 0 ? empty_spot : self[to_pos] )
    self[to_pos] = piece
    self[pos] = empty_spot
    piece.pos = to_pos
    checked = self.in_check?(piece.color) unless piece.color == :none
    self[pos] = piece
    piece.pos = pos
    self[to_pos] = piece_in_spot_before
    piece_in_spot_before.pos = to_pos
    checked
  end

end
