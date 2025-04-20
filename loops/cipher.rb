puts "give us a string as an input:"
user_input = gets.chomp
puts "how many would you like the Cipher to shift:"
shift_factor = gets.chomp.to_i

def caesar_cipher(user_input, shift_factor)
  alphabet = ("a".."z").to_a
  result = []

  user_input.chars.each do |input_letter|
    result << shift_letter(input_letter, shift_factor, alphabet)
  end

  result.join
end

def shift_letter(input_letter, shift_factor, alphabet)
  if alphabet.include?(input_letter)
    index = alphabet.index(input_letter)
    cyphered_letter_index = (index + shift_factor) % alphabet.length
    alphabet[cyphered_letter_index]
  else
    input_letter
  end
end

puts caesar_cipher(user_input, shift_factor)
