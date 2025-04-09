def factorial(n)
  result = 1
  counter = 1
  while counter <= n
    result *= counter
    counter += 1
  end
  result
end

puts factorial(3)
