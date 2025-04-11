# 7. Word Frequency Counter 🔤
# Story: You are a text analyst reviewing a document. You want to know how many times each word appears in a given paragraph to identify important or repeated concepts.
# Problem: Write a method word_frequencies(text) that takes a string of text and returns a hash mapping each word to the number of times it appears in the text.
# For simplicity, you can assume words are separated by spaces and punctuation is removed (or you can ignore punctuation).
# The counting should be case-insensitive (e.g., "Ruby" and "ruby" count as the same word).

# def frequencies(text)
#   words_array = text.split("")
#   takes string, and iterate through each word
#     using expressions remove/skape spaces and characters.
#   store every word in to a array

#   then we create another loop to iterate through the words_array and store it in a new hash
#     if word doesn't exisits in the new hash .push it and put the value as 1
#     else (word exisits) in the new has then value += 1
#     end
#     return hash
#   end
# end

words_hash = {}

def frequencies(text)
  small_words = text.downcase
  words_array = small_words.split(/[^\w]+/).reject(&:empty?)
  words_array.each_with_object(Hash.new(0)) do |word, hash|
    hash[word] += 1
  end
end

puts frequencies("My name is Amin, and I have a lot of I in here, I i I")
