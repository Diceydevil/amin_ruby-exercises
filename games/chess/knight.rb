module Knight
  class Board
    attr_reader :board

    def initialize
      @board = Array.new(8) { Array.new(8) }
    end

    def valid_move?(x, y)
      x.between?(0, 7) && y.between?(0, 7)
    end

    def possible_moves(pos)
      x, y = pos
      moves = [
        [x+2, y+1], [x+2, y-1],
        [x-2, y+1], [x-2, y-1],
        [x+1, y+2], [x+1, y-2],
        [x-1, y+2], [x-1, y-2]
      ]
      moves.select { |move| valid_move?(*move) }
    end

    def knight_moves(start_pos, end_pos)
      queue = [[start_pos]]
      visited = [start_pos]

      until queue.empty?
        path = queue.shift
        current_pos = path.last

        return path if current_pos == end_pos

        possible_moves(current_pos).each do |next_pos|
          unless visited.include?(next_pos)
            visited << next_pos
            queue << path + [next_pos]
          end
        end
      end
    end

    def display_path(path)
      puts "You made it in #{path.length - 1} moves! Here's your path:"
      path.each { |pos| puts pos.inspect }
    end

    def visualize_path(path)
      # Create a visual board representation
      visual_board = Array.new(8) { Array.new(8, " . ") }
      
      # Mark start with 'S'
      start_x, start_y = path.first
      visual_board[start_y][start_x] = " S "
      
      # Mark end with 'E'
      end_x, end_y = path.last
      visual_board[end_y][end_x] = " E "
      
      # Mark intermediate steps with numbers
      path[1..-2].each_with_index do |pos, i|
        x, y = pos
        # Use single digit numbers with padding
        visual_board[y][x] = " #{i+1} "
      end
      
      # Print column numbers with proper spacing
      puts "\nVisual path:"
      print "    " # Extra space for row numbers
      (0..7).each { |i| print " #{i} " }
      puts
      
      # Print rows with row numbers
      visual_board.each_with_index do |row, i|
        print " #{i}  " # Align row numbers
        puts row.join
      end
      puts
    end
  end
end

