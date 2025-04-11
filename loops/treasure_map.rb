# Story: You have a treasure map in the form of a two-dimensional grid (an array of arrays).
# Each element of the sub-array is a character, like '~' for water or '*' for land. One of the spots is marked with an 'X' which indicates treasure.
# You need to find the location of the treasure.
# Problem: Write a method find_treasure(map) that takes a 2D array (an array of arrays) representing the map, and returns the coordinates of the treasure 'X'.
# Coordinates can be represented as a two-element array [row_index, col_index].
# If the map has r rows and c columns, row indices range from 0 to r-1 and column indices from 0 to c-1.
# Use nested loops to search through the grid. Stop when you find the treasure.

map = [
  ["~", "~", "*"],
  ["*", "X", "*"],
  ["~", "*", "~"]
]

def find_treasure(map)
  map.each_with_index do |row, row_index|
    row.each_with_index do |tile, col_index|
      if tile == "X"
        return "Found X at index: #{row_index} and column: #{col_index}"
      end
    end
  end
end

p find_treasure(map)
