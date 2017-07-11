require_relative 'piece.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'pawn.rb'
require_relative 'null_piece.rb'

require 'byebug'

class Board

  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def make_starting_grid
    back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    start_rows = [0, 1, 6, 7]
    self.board.each_with_index do |row, idx|
      case idx
      when 0
          row.each_with_index{|sqr, i| row[i] = back_row[i].new([idx, i], self, :black) }
      when 1
            row.each_with_index{|sqr, i| row[i] = Pawn.new([idx, i], self, :black) }
      when 6
          row.each_with_index{|sqr, i| row[i] = Pawn.new([idx, i], self, :white) }
      when 7
          row.each_with_index{|sqr, i| row[i] = back_row[i].new([idx, i], self, :white) }
      else
          row.each_with_index{|sqr, i| row[i] = NullPiece.new([idx, i], self, :black) }
      end
    end
  end

  def [](pos)
    x, y = pos
    self.board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    self.board[x][y] = value
  end


  def move_piece(from_pos, to_pos)
    raise ArgumentError, "There is no piece to move" if self[from_pos].nil?
    raise ArgumentError, "Position not in board" unless to_pos.all?{|i| i.between?(0,7) }
    self[to_pos] = self[from_pos]
    self[from_pos] = nil
  end

  def dup

  end

  def move_piece!(from_pos, to_pos)

  end

  def check_mate?

  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0,7)}
  end


  def find_king(color)

  end

end
