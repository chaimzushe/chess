require 'rubygems'
require 'bundler/setup'
require 'byebug'

# require your gems as usual
require 'colorize'
require_relative 'cursor.rb'


class Display

  attr_reader :board, :notifications, :cursor, :selected_piece

  def initialize(board)
    @selected_piece = nil
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
  end

  def build_grid
    @board.board.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |sqr, j|
      sqr.to_s.colorize(colors_for(i, j))
    end
  end

  def colors_for(i, j)
    available_moves = []
    piece_pos = cursor.selected && cursor.cursor_pos
    @selected_piece ||= board[piece_pos] if piece_pos
    available_moves =  @selected_piece.moves if @selected_piece

    if [i, j] == cursor.cursor_pos && cursor.selected
      bg = :light_yellow
    elsif [i, j] == cursor.cursor_pos
      bg = :yellow
    elsif cursor.cursor_pos  && cursor.selected && available_moves.include?([i, j])
      bg = :light_blue
    elsif (i +j).odd?
      bg = :cyan
    else (i +j).odd?
      bg = :white
    end
    @selected_piece = nil  unless cursor.selected
    {background: bg}
  end


  def reset!
    @notifications.delete(:errors)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def check!
    @notifications[:check] = "Check!"
  end

  def render
    system('clear')
    puts "Arrow keys, WASD, or vim to move. space or enter to confirm"
    build_grid.each {|row| puts row.join }
    @notifications.each { |type, msg| puts "#{msg}" }
  end


end
