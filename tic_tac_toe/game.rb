# the actual game which bring the Player and Board together

require_relative "player"
require_relative "board"

class Game
  def initialize(player1_name, player2_name)
    @players = [
      Player.new(player1_name, "O"),
      Player.new(player2_name, "X")
    ]
    @scores = {"O" => 0, "X" => 0}
  end

  def play
    loop do
      board = Board.new
      current = 0 # index into @players

      until board.winner?(@players[current].symbol) || board.full?
        board.display
        move = @players[current].get_move(board.taken_positions)
        board.mark(move, @players[current].symbol)
        current = 1 - current  # switch 0⇄1
      end

      board.display
      if board.winner?(@players[1 - current].symbol)
        winner = @players[1 - current]
        puts "#{winner.name} (#{winner.symbol}) wins!"
        @scores[winner.symbol] += 1
      else
        puts "It's a draw!"
      end

      puts "Score: O=#{@scores["O"]}  X=#{@scores["X"]}"
      print "Play again? (y/n): "
      break unless gets.chomp.downcase.start_with?("y")
    end

    puts "Thanks for playing!"
  end
end
