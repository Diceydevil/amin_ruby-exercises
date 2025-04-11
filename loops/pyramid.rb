# Story: You are constructing a pyramid out of blocks. The pyramid will have a certain number of rows, and each row has one more block than the one above it.
# This forms a triangle shape of * characters when printed to the screen.

# Problem: Write a method print_triangle(rows) that prints a left-aligned triangle of * characters with the given number of rows.
# The first row should have 1 star, the second row 2 stars, and so on. For example, print_triangle(4) should produce:

# *
# **
# ***
# ****

# Use nested loops: one loop to handle the rows, and an inner loop to handle printing the correct number of * for that row. (Alternatively, you can use string multiplication, but try the loops for practice.)

def triangle(rows)
  (1..rows).each do |row|
    puts "*" * row
  end
end

p triangle(10)
