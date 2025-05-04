def palindrome(string)
  # Base case: empty string or single character is a palindrome
  return true if string.length <= 1
  
  # Compare first and last character
  if string[0] == string[-1]
    # Recursively check middle substring
    palindrome(string[1..-2])
  else
    false
  end
end

puts palindrome("racecar")
puts palindrome("hello") 