require_relative 'piece.rb'
require 'Singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :none
  end
  def symbol
     " "
  end

  def moves
    []
  end

  def value
    0
  end

end
