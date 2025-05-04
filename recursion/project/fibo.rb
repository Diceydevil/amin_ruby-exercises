def fibonacci(n)
  return n if n <= 1
  fibonacci(n-1) + fibonacci(n-2)
end


def fibs(n)
  return [] if n == 0
  return [0] if n == 1

  fibs = [0, 1]
  (2...n).each do |i|
    fibs << fibs[i-1] + fibs[i-2]
  end
  fibs
end

def fibs_rec(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2

  prev = fibs_rec(n-1)
  prev << prev[-1] + prev[-2]
  prev
end

puts fibs_rec(10)
puts "---"
puts fibs(10)
puts "---"
puts fibonacci(10)
