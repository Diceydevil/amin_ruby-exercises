def bottles_of_beer(n)
  if n == 0
    puts "No more bottles of beer on the wall, no more bottles of beer."
    puts "Go to the store and buy some more, 99 bottles of beer on the wall."
    return
  end 

  puts "#{n} bottles of beer on the wall, #{n} bottles of beer."
  puts "Take one down and pass it around, #{n-1} bottles of beer on the wall."
  bottles_of_beer(n-1)
end

puts bottles_of_beer(99)