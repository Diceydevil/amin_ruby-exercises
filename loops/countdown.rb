def launch_countdown(n)
  puts n
  while n > 0
    n -= 1
    puts n
  end
end

puts launch_countdown(10)
