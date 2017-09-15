require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'


class Game
  attr_reader :board, :display, :current_player, :players

  def initialize(play_against = 'c')
    @board =  Board.new
    @display = Display.new(@board)
    @players = get_players(play_against)

    @current_player = :white
  end

  def get_players(play_against)
    if(play_against == 'c')
      return {
      white: HumanPlayer.new(:white, @display),
      black: ComputerPlayer.new(:black, @display)
      }
    else
     return {
       white: HumanPlayer.new(:white, @display),
       black: HumanPlayer.new(:black, @display),
       }
    end

  end

  def play
    until board.check_mate?(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(current_player, start_pos, end_pos)
        self.switch_turns!

      rescue StandardError => e
          @display.notifications[:errors] = e.message
      retry
      end
    end
    display.render
    puts "#{current_player} is checkmated"
  end

  def switch_turns!
    @current_player = (current_player == :white) ? :black : :white
  end

  def notify_players
    if board.in_check?
      display.check!
    else
      display.uncheck!
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game =  (ARGV[0] == '-h' ? Game.new("h") : Game.new)
  game.play
end
