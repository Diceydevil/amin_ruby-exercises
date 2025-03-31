# 1. dictionary: we have a dictionary
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

# 2. request a string from the user
puts "Give a word or a sentence:"
input_string = gets.chomp

# 2.def sub_string (input_string, dictionary)
#   results = {}
#   lowercase_string = input_string.downcase
#   string_array = lowercase_string.split("")
#   dictionary.each do |word|
#     - count = input_string.scan(/#{word}/i).length
#     - results[""] = count if count > 0
#   end
# end

def substring(input_string, dictionary)
  results = {}

  dictionary.each do |word|
    count = input_string.scan(/#{word}/i).length
    results[word] = count if count > 0
  end

  results
end

# 3. return the result hash
puts substring(input_string, dictionary)
