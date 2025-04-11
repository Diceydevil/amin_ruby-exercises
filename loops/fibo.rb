# 9. Fibonacci Sequence 🐇
# Story: Fibonacci numbers appear in nature (like rabbit reproduction patterns, flower petals counts, etc.).
# You want to generate this sequence for a given length. In the Fibonacci sequence, the first two numbers are 0 and 1, and each subsequent number is the sum of the previous two.
# Problem: Write a method generate_fibonacci(n) that returns an array of the first n Fibonacci numbers.
# For example, if n=6, it should return the first 6 Fibonacci numbers [0, 1, 1, 2, 3, 5]. Use a loop to build the sequence number by number.

def generate_fibonacci(n)
  fibo_starter_array = [0, 1]

  while fibo_starter_array.length < n
    next_sequence = fibo_starter_array[-1] + fibo_starter_array[-2]
    fibo_starter_array.push(next_sequence)
  end
  fibo_starter_array
end

p generate_fibonacci(10)
