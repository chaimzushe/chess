require_relative 'piece.rb'
require 'Singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = " "
  end

  def moves
    []
  end
end
