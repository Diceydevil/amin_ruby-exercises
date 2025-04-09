dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts "give some strings: "
user_input_string = gets.chomp

def substring(user_input_string, dictionary)
  user_input_string = user_input_string.downcase
  result = Hash.new(0)

  dictionary.each do |word|
    # Use scan to find all occurrences of the word as a substring
    matches = user_input_string.scan(word)
    result[word] = matches.length if matches.any?
  end

  result
end

puts substring(user_input_string, dictionary)
