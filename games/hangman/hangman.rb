# You will be building a command line Hangman game where one player plays against the computer, but a bit more advanced.

# When a new game is started, your script should load in the dictionary and randomly
# select a word between 5 and 12 characters long for the secret word.

# You don’t need to draw an actual stick figure (though you can if you want to!),
# but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends.

# You should also display which correct letters have already been chosen (and their position in the word,
# e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.

# Every turn, allow the player to make a guess of a letter.
# It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect.
# If out of guesses, the player should lose.

# Now implement the functionality where, at the start of any turn,
# instead of making a guess the player should also have the option to save the game.
# Remember what you learned about serializing objects.

# When the program first loads, add in an option that allows you to open one of your saved games,
# which should jump you exactly back to where you were when you saved. Play on!#

require "set"
require "json"
require_relative "word_picker"
require_relative "stick_man"
require_relative "save_and_load"

module Hangman
  # Read the dictionery file -> pick a random word that is 5-12 character.
  class Computer
    def pick_word
      WordPicker.pick_a_word
    end
  end

  class Game
    attr_reader :lives_remaining, :correct_guesses, :wrong_guesses

    def initialize
      @secret_word = Computer.new.pick_word
      @correct_guesses = Set.new
      @wrong_guesses = Set.new
      @lives_remaining = 7
    end

    def alphabet
      ("a".."z").to_a
    end

    def guess(letter)
      letter = letter.downcase
      return :repeat if guessed_before?(letter)

      unless alphabet.include?(letter)
        puts "Please use a letter an input, this game doesn't accept symbols or numbers."
      end

      if @secret_word.include?(letter)
        correct_guesses << letter
        :correct
      else
        wrong_guesses << letter
        @lives_remaining -= 1
        :wrong
      end
    end

    def display_progress
      @secret_word.chars.map { |c| correct_guesses.include?(c) ? c : "_" }.join(" ")
    end

    def over?
      won? || lost?
    end

    def won?
      @secret_word.chars.all? { |c| correct_guesses.include?(c) }
    end

    def lost?
      lives_remaining <= 0
    end

    def display_stickman
      StickMan.new(wrong_guesses.size).draw
    end

    # Export all the bits we need to resume play
    def to_h
      {
        "secret_word" => @secret_word,
        "correct_guesses" => @correct_guesses.to_a,
        "wrong_guesses" => @wrong_guesses.to_a,
        "lives_remaining" => @lives_remaining
      }
    end

    private

    def guessed_before?(letter)
      correct_guesses.include?(letter) || wrong_guesses.include?(letter)
    end

    # Build a new Game instance from a Hash
    def self.from_h(state)
      game = new 
      game.instance_variable_set(:@secret_word, state["secret_word"])
      game.instance_variable_set(:@correct_guesses, Set.new(state["correct_guesses"]))
      game.instance_variable_set(:@wrong_guesses, Set.new(state["wrong_guesses"]))
      game.instance_variable_set(:@lives_remaining, state["lives_remaining"])
      game
    end
  end
end
