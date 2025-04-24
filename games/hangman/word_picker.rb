# Write a little script or method that loads the file, filters, and prints 10 random words. Run it to convince yourself it works before integrating into your classes.

module WordPicker
  DICTIONARY_PATH = "google_10000_english.txt"

  def self.pick_a_word(path = DICTIONARY_PATH)
    lines = File.readlines(path).map(&:chomp)
    candidates = lines.select { |w| w.length.between?(5, 12) }
    candidates.sample.downcase
  end
end
