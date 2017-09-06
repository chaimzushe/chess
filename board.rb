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

end
