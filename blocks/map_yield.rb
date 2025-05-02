# Write a method my_map(arr) that yields each element of arr to a block and returns a new array with the block’s return values.

def my_map(arr)
  puts "Before block:"
  result = arr.map do |item|
    puts "before yield"
    yield(item)
    puts "after yield"
  end
  puts "after block."
  result
end

numbers = [1, 2, 3, 4, 5]
result = my_map(numbers) { |n| n * 2 }
puts "Redult of calling the method: #{result.inspect}"