# def

# 4. turn the strning into individual letters in an array

# 5. Go through each index of string's array, find equivalent of it in the alphabet variable,
# shift it (shift_factor) number to the left or right.
# 6. store the newly characters in the ciphered array.
# 7. join the ciphered array together in a new variable
# 7. return the new varibale (ciphered string.)

# 1. have an array made of a - z individual letters

puts "give a string:"
input = gets.chomp.chars
puts "select a number as a shift factor:"
shift_factor = gets.chomp.to_i

def caesar_cipher(input, shift_factor)
  alphabet = ("a".."z").to_a
  ciphered = input.map do |char|
    index_in_alphabet = alphabet.index(char)
    shifted_index = (index_in_alphabet + shift_factor) % alphabet.length
    alphabet[shifted_index]
  end
end

result = caesar_cipher(input, shift_factor)
puts result.join
