# Story: You’re at the cashier scanning items. Each item has a price. You want to calculate the total bill and also print each item with its price as you scan them.
# Problem: Write a method checkout(cart) that takes a hash where the keys are item names (strings) and the values are prices (numbers).
# The method should loop through the hash, print each item and price in a readable format, and then return the total price of all items.

def checkout(cart)
  total = 0
  cart.each do |item, price|
    puts "Item is #{item} | Price is #{price}\n"
    total += price
  end
  puts "----------------------------------------"
  puts "The total is #{total}\n"
end

cart = {"Apple" => 1.99, "Banana" => 0.99, "Orange" => 2.49}
checkout(cart)
