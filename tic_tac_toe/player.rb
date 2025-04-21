# This is Player class for the tic tac toe game.
class Player
  attr_reader :symbol, :name

  def initialize(name, symbol)
    @name = name # e.g. "Alice" or "Bob"
    @symbol = symbol # "O" or "X"
  end

  # Ask this player for their next move (1–9), validating input
  def get_move(taken_positions)
    loop do
      print "#{name} (#{symbol}), pick an available block (1–9): "
      choice = gets.chomp.to_i
      return choice if (1..9).cover?(choice) && !taken_positions.include?(choice)

      puts "Invalid or already taken. Try again."
    end
  end
end
