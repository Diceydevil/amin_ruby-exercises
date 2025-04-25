# Goal: Read a plaintext word list, filter by length, write results.
# Input: A file words.txt (one word per line).
# Task:
# Load all words into an array.
# Select only those with length ≥ 5 and ≤ 10.
# Write the filtered list to filtered_words.txt.

read_file = File.readlines("google_10000_english.txt").map(&:chomp)
filter = read_file.select { |w| w.length.between?(5, 12) }
list_of_words = []
puts filter.push(list_of_words)
