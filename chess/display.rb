require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display

  attr_reader :board, :cursor
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], board)
  end

  def render_loop

    until false
      system('clear')
      render
      self.cursor.get_input
    end

  end


  def render
    self.board.board.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        pos = idx1, idx2
        if pos == self.cursor.cursor_pos && self.cursor.selected
          print "#{self.board[pos].to_s.colorize(:background => :yellow)}"
        elsif pos == self.cursor.cursor_pos
          print "#{self.board[pos].to_s.colorize(:background => :green)}"
        elsif (idx1 + idx2).even?
          print "#{self.board[pos].to_s.colorize(:background => :red)}"
        else
          print "#{self.board[pos].to_s.colorize(:background => :blue)}"
        end
      end
      print "\n"
    end
  end

end

display = Display.new
display.render_loop
