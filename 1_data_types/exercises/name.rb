def get_full_name
  puts "What is your first name?"
  first_name = gets.chomp
  puts "What is your last name?"
  last_name = gets.chomp
  first_name + " " + last_name
end

full_name = get_full_name
puts "Hello, #{full_name}!"

10.times do
  puts full_name
end
