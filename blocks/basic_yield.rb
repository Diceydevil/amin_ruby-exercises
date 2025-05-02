# Write a method repeat(n) that takes an integer n, yields to a block n times, and collects each block’s return value into an array which it then returns.

# Example usage:
# result = repeat(3) { |i| i * 2 }
# Expected result: [0, 2, 4]

def repeat(n)
  array = []
  n.times do |i|
    array.push(yield(i))
  end
  array
end