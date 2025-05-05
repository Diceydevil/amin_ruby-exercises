require_relative 'board'
require_relative 'logic'
require_relative 'player'

class ChessGame
  def initialize
    @logic = GameLogic.new
    @board = @logic.board
    @players = {
      white: Player.new("Player 1", :white),
      black: Player.new("Player 2", :black)
    }
  end

  def play
    until @logic.game_over
      @board.display
      
      current_player = @players[@logic.current_player]
      puts "#{current_player.name}'s turn (#{current_player.color})"
      
      if @logic.in_check?(current_player.color)
        puts "#{current_player.name} is in check!"
      end
      
      start_pos, end_pos = current_player.get_move
      
      # Try to make the move
      valid_move = @logic.make_move(start_pos, end_pos)
      
      unless valid_move
        puts "Invalid move! Try again."
      end
    end
    
    # Game over
    @board.display
    winner = @logic.current_player == :white ? :black : :white
    puts "Checkmate! #{@players[winner].name} (#{winner}) wins!"
  end
end

# Start the game
if __FILE__ == $PROGRAM_NAME
  ChessGame.new.play
end
