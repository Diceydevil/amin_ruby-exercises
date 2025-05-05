require_relative 'pieces/piece'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'
require_relative 'pieces/pawn'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
    setup_board
  end

  def setup_board
    # Place pawns
    8.times do |col|
      place_piece(Pawn.new(:white, [6, col]), [6, col])
      place_piece(Pawn.new(:black, [1, col]), [1, col])
    end
    
    # Place rooks
    place_piece(Rook.new(:white, [7, 0]), [7, 0])
    place_piece(Rook.new(:white, [7, 7]), [7, 7])
    place_piece(Rook.new(:black, [0, 0]), [0, 0])
    place_piece(Rook.new(:black, [0, 7]), [0, 7])

    # Place knights
    place_piece(Knight.new(:white, [7, 1]), [7, 1])
    place_piece(Knight.new(:white, [7, 6]), [7, 6])
    place_piece(Knight.new(:black, [0, 1]), [0, 1])
    place_piece(Knight.new(:black, [0, 6]), [0, 6])

    # Place bishops
    place_piece(Bishop.new(:white, [7, 2]), [7, 2])
    place_piece(Bishop.new(:white, [7, 5]), [7, 5])
    place_piece(Bishop.new(:black, [0, 2]), [0, 2])
    place_piece(Bishop.new(:black, [0, 5]), [0, 5])

    # Place queens
    place_piece(Queen.new(:white, [7, 3]), [7, 3])
    place_piece(Queen.new(:black, [0, 3]), [0, 3])

    # Place kings
    place_piece(King.new(:white, [7, 4]), [7, 4])
    place_piece(King.new(:black, [0, 4]), [0, 4])
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def valid_position?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def place_piece(piece, pos)
    if valid_position?(pos)
      self[pos] = piece
      piece.pos = pos
      true
    else
      false
    end
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]

    return false if piece.nil?
    return false unless valid_position?(end_pos)
    return false unless piece.valid_move?(end_pos, self)

    self[start_pos] = nil
    self[end_pos] = piece
    piece.pos = end_pos
    true
  end

  def in_check?(color)
    # Find the king position
    king_pos = nil
    @grid.each_with_index do |row, r|
      row.each_with_index do |piece, c|
        if piece && piece.is_a?(King) && piece.color == color
          king_pos = [r, c]
          break
        end
      end
      break if king_pos
    end
    
    return false unless king_pos # No king found
    
    # Check if any opponent piece can attack the king
    @grid.each_with_index do |row, r|
      row.each_with_index do |piece, c|
        if piece && piece.color != color
          begin
            return true if piece.valid_move?(king_pos, self)
          rescue => e
            puts "Error checking move for #{piece.class} at #{[r, c]}: #{e.message}"
          end
        end
      end
    end
    
    false
  end

  def find_king(color)
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        return [row_idx, col_idx] if piece.is_a?(King) && piece.color == color
      end
    end
    nil
  end

  def display
    puts "  a b c d e f g h"
    @grid.each_with_index do |row, row_idx|
      print "#{8 - row_idx} "
      row.each do |piece|
        if piece.nil?
          print "□ "
        else
          print "#{piece.symbol} "
        end
      end
      puts "#{8 - row_idx}"
    end
    puts "  a b c d e f g h"
  end
end