require "json"
require "set"

require_relative "word_picker"
require_relative "stick_man"
require_relative "save_and_load"
require_relative "hangman"

include Hangman

puts "Welcome to Hangman!"
puts "1) New game"
puts "2) Load game"
print "> "
choice = gets.chomp

# Initialize game
game = if choice == "2"
  saves = SaveGame.list_saves
  if saves.empty?
    puts "No saved games found. Starting a new game."
    Game.new
  else
    puts "Choose a save to load:"
    saves.each_with_index { |fn, i| puts "#{i + 1}) #{fn}" }
    print "> "
    idx = gets.chomp.to_i - 1
    SaveGame.load(saves[idx])
  end
else
  Game.new
end

# Main game loop
until game.over?
  puts "\n" + game.display_progress
  puts "Wrong letters: #{game.wrong_guesses.to_a.join(", ")}"
  game.display_stickman
  puts "Lives left: #{game.lives_remaining}"
  print "Guess a letter (or type 'save'): "
  input = gets.chomp.downcase

  if input == "save"
    fname = SaveGame.save(game)
    puts "Game saved as #{fname}."
    next
  end

  result = game.guess(input)
  case result
  when :correct
    puts "Good guess!"
  when :wrong
    puts "Oops — '#{input}' isn't in the word."
  when :repeat
    puts "You've already tried '#{input}'."
  end
end

# Endgame
if game.won?
  puts "\nCongratulations! You guessed the word: #{game.instance_variable_get(:@secret_word)}"
else
  puts "\nGame over. The word was: #{game.instance_variable_get(:@secret_word)}"
end
