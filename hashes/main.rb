require_relative 'hash'

hash = HashMap.new

hash.set('key1', 'value1')
hash.set('key2', 'value2')

hash.set('apple', 'red')
hash.set('banana', 'yellow')
hash.set('carrot', 'orange')
hash.set('dog', 'brown')
hash.set('elephant', 'gray')
hash.set('frog', 'green')
hash.set('grape', 'purple')
hash.set('hat', 'black')
hash.set('ice cream', 'white')
hash.set('jacket', 'blue')
hash.set('kite', 'pink')
hash.set('lion', 'golden')

puts hash.get('key1')
puts hash.get('key2')
puts hash.get('apple')
puts hash.get('banana')
puts hash.get('carrot')

puts hash.length

puts "____________"

# Don't try to print the return value of set
hash.set('apple', 'green')
hash.set('banana', 'brown')

puts "New value of apple: #{hash.get('apple')}"
puts "New value of banana: #{hash.get('banana')}"

puts hash.length

puts "____________"

hash.set('moon', 'silver')
hash.set('sun', 'yellow')

# After resizing, print bucket count to verify resize happened
puts "Bucket count: #{hash.instance_variable_get(:@buckets).length}"
puts "Load factor: #{hash.length.to_f / hash.instance_variable_get(:@buckets).length}"
puts hash.length

puts "____________"
puts "Testing overwriting values after expansion:"
hash.set('moon', 'bright silver')
hash.set('sun', 'bright yellow')
puts "Updated moon: #{hash.get('moon')}"
puts "Updated sun: #{hash.get('sun')}"

puts "____________"
puts "Testing has? method:"
puts "Has 'apple'? #{hash.has?('apple')}"
puts "Has 'watermelon'? #{hash.has?('watermelon')}"

puts "____________"
puts "Testing remove method:"
puts "Removing 'lion': #{hash.remove('lion')}"
puts "Length after removal: #{hash.length}"
puts "Has 'lion' after removal? #{hash.has?('lion')}"

puts "____________"
puts "Testing keys method:"
puts "Keys: #{hash.keys.join(', ')}"

puts "____________"
puts "Testing values method:"
puts "Values: #{hash.values.join(', ')}"

puts "____________"
puts "Testing entries method:"
puts "Entries:"
hash.entries.each { |key, value| puts "  #{key}: #{value}" }

puts "____________"
puts "Testing clear method:"
hash.clear
puts "Length after clear: #{hash.length}"
puts "Keys after clear: #{hash.keys.join(', ')}"
