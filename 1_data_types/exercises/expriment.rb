arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)

p arr

puts "BREAK..."

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)

p arr

puts "BREAK..."

Array(1...8)
