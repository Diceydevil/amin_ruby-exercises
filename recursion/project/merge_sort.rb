def divide(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = divide(arr[0...mid])
  right = divide(arr[mid..-1])

  merge(left, right)
end

def merge(left, right)
  result = []

  while left.any? && right.any?
    if left[0] <= right[0]
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end


arr = [3, 2, 1, 13, 8, 5, 0, 1, 4, 5]
sorted_arr = divide(arr)
puts "Original arr: #{arr}"
puts "Sorted arr: #{sorted_arr}"
