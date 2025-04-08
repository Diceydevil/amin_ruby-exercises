require "debug"

def sort_wiredly(array)
  sorted = array.sort
  result = []

  while sorted.any?
    result << sorted.pop
    result << sorted.shift if sorted.any?
  end

  p result
end

array = [15, 11, 10, 7, 12]
puts sort_wiredly(array)
