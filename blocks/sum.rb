# Write a method sum(n) that yields numbers from 1 to n to a block and returns the sum of the block’s return values.

def sum(n)
  sum = 0
  1.upto(n) do |i|
    sum += yield(i)
  end
  sum
end

result = sum(5) { |n| n * 2}
puts result