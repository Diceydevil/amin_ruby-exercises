require_relative 'knight'

def knight_moves(start_pos, end_pos)
  board = Knight::Board.new
  path = board.knight_moves(start_pos, end_pos)
  board.display_path(path)
  board.visualize_path(path)
end

# Test cases
puts "Test 1:"
knight_moves([0,0],[1,2])

puts "\nTest 2:"
knight_moves([0,0],[3,3])

puts "\nTest 3:"
knight_moves([3,3],[0,0])

puts "\nTest 4:"
knight_moves([0,0],[7,7])

puts "\nTest 5:"
knight_moves([3,3],[4,3])