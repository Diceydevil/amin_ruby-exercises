puts "give us a string as an input:"
user_input = gets.chomp
puts "how many would you like the Cipher to shift:"
shift_factor = gets.chomp.to_i

def caesar_cipher(user_input, shift_factor)
  alphabet = ("a".."z").to_a
  result = []

  user_input_array = user_input.split("")
  user_input_array.each do |input_letter|
    if alphabet.include?(input_letter)
      index = alphabet.index(input_letter)
      cyphered_letter_index = (index + shift_factor) % alphabet.length
      new_letter = alphabet[cyphered_letter_index]
      result << new_letter
    else
      result << input_letter
    end
  end

  result.join
end

puts caesar_cipher(user_input, shift_factor)
