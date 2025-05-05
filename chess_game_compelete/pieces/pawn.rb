require_relative 'piece'

class Pawn < Piece
  def initialize(color, pos = nil)
    super
  end

  def symbol
    color == :white ? "♙" : "♟"
  end

  def valid_move?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    # Calculate direction based on color
    direction = (color == :white) ? -1 : 1
    
    # Regular forward move (1 space)
    if col == end_col && end_row == row + direction && board[end_pos].nil?
      return true
    end
    
    # Initial two-space move
    starting_row = (color == :white) ? 6 : 1
    if row == starting_row && col == end_col && end_row == row + 2 * direction && 
       board[[row + direction, col]].nil? && board[end_pos].nil?
      return true
    end
    
    # Diagonal capture
    if (end_col == col + 1 || end_col == col - 1) && 
       end_row == row + direction && 
       !board[end_pos].nil? && 
       board[end_pos].color != color
      return true
    end
    
    false
  end
end