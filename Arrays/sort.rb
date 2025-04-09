array = [1, 2, 6, 4, 10, 5, 7, 9, 3, 8]

def sort_array(array)
  swapped = true
  while swapped
    swapped = false
    array.each_with_index do |number, index|
      next if index == array.length - 1
      first_number = array[index]
      second_number = array[index + 1]
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        swapped = true
      end
    end
  end
  array
end

puts sort_array(array)
