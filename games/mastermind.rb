module Mastermind
  # Base player class
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  # Codemaker picks the secret code
  class Codemaker < Player
    COLORS = { red: "🔴", blue: "🔵", green: "🟢", yellow: "🟡" }.freeze
    FEEDBACK_COLORS = { correct_position: "⚫", correct_color: "⚪" }.freeze
    attr_reader :secret_code

    def pick_secret_code(length: 4)
      @secret_code = Array.new(length) { COLORS.values.sample }
    end
  end

  # Codebreaker makes guesses
  class Codebreaker < Player
    def make_guess(length: 4)
      puts "#{name}, enter your #{length}-peg guess (choices: #{Codemaker::COLORS.values.join(', ')}), separated by spaces:"
      input = gets.chomp.split
      if input.size != length || input.any? { |color| !Codemaker::COLORS.keys.include?(color.to_sym) }
        puts "Invalid color(s) in guess. Try again."
        return make_guess(length: length)
      end
      input.map { |color| Codemaker::COLORS[color.to_sym] }
    end
  end

  # Keeps history of guesses + feedback
  class Board
    def initialize
      @history = []
    end

    def record(guess, feedback)
      @history << {guess: guess, feedback: feedback}
    end

    def display
      puts "\n=== Board ==="
      @history.each_with_index do |entry, idx|
        guess_display = entry[:guess].join(" ")
        feedback_display = Codemaker::FEEDBACK_COLORS[:correct_position] * entry[:feedback][:black] + Codemaker::FEEDBACK_COLORS[:correct_color] * entry[:feedback][:white]
        puts "Turn #{idx + 1}: [#{guess_display}] => #{feedback_display}"
      end
      puts "=============\n\n"
    end
  end

  # Orchestrates the game flow
  class Game
    MAX_TURNS = 10
    CODE_LENGTH = 4

    def initialize(codemaker, codebreaker)
      @codemaker = codemaker
      @codebreaker = codebreaker
      @board = Board.new
    end

    def self.evaluate_feedback(secret, guess)
      blacks = secret.zip(guess).count { |s, g| s == g }
      total_matches = secret.uniq.sum { |color| [secret.count(color), guess.count(color)].min }
      whites = total_matches - blacks
      {black: blacks, white: whites}
    end

    def play
      @codemaker.pick_secret_code(length: CODE_LENGTH)
      turn = 1

      while turn <= MAX_TURNS
        guess = @codebreaker.make_guess(length: CODE_LENGTH)
        feedback = Game.evaluate_feedback(@codemaker.secret_code, guess)
        @board.record(guess, feedback)
        @board.display

        if feedback[:black] == CODE_LENGTH
          puts "✅ Cracked in #{turn} turns! Secret was: #{@codemaker.secret_code.join(", ")}"
          return
        end

        turn += 1
      end

      puts "❌ Out of turns. The code was: #{@codemaker.secret_code.join(", ")}"
    end
  end
end

# If run directly, start a quick game
if __FILE__ == $0
  puts "Codemaker, enter your name:"
  cm_name = gets.chomp
  cm = Mastermind::Codemaker.new(cm_name)
  puts "Codebreaker, enter your name:"
  cb_name = gets.chomp
  cb = Mastermind::Codebreaker.new(cb_name)
  Mastermind::Game.new(cm, cb).play
end
