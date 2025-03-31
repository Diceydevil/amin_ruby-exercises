family = {uncles: ["bob", "joe", "steve"],
          sisters: ["jane", "jill", "beth"],
          brothers: ["frank", "rob", "david"],
          aunts: ["mary", "sally", "susan"]}

sibilings = family.select do |key, value|
  key == :sisters || key == :brothers
end

p sibilings.values.flatten

car_1 = {car: {color: "red"}}
car_2 = {car: {speed: "100mph"}}

option1 = {colour: "red", make: "bmw", model: "m3"}
option2 = {shape: "convertable", speed: "super fast"}

p option1.merge(option2)
p option1.merge!(option2)

option1.each { |key, value| puts "#{key}, and #{value}" }

person = {name: "Bob", occupation: "web developer", hobbies: "painting"}

puts person[:name]

specific_value = "Specific Value"
hash = {key1: "Specific Value", key2: "something else", key3: "something something"}
puts hash.value?(specific_value)
