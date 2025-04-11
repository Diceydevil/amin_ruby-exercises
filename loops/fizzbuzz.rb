# 4. FizzBuzz Fun 🎉
# Story: FizzBuzz is a classic children’s game that is often used as a coding challenge. Children count aloud, but replace certain numbers with words, making it a fun puzzle.
# Problem: Write a method fizz_buzz(n) that iterates from 1 up to n and prints each number.
# But for multiples of 3, print "Fizz" instead of the number,
# for multiples of 5 print "Buzz", and for numbers which are multiples of both 3 and 5, print "FizzBuzz".
# Use a loop and conditional logic inside it.

def fizz_buzz(n)
  counter = 0
  while counter < n
    counter += 1
    if counter % 3 == 0 && counter % 5 == 0
      puts "FizzBuzz"
    elsif counter % 3 == 0
      puts "Fizz"
    elsif counter % 5 == 0
      puts "Buzz"
    else
      puts counter
    end
  end
end

p fizz_buzz(19)
