require_relative 'piece'

class King < Piece
  def symbol
    color == :white ? "♔" : "♚"
  end

  def valid_move?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    # King moves one square in any direction
    row_diff = (row - end_row).abs
    col_diff = (col - end_col).abs
    
    # King can move one square in any direction
    return false unless row_diff <= 1 && col_diff <= 1
    
    # Can't move to a position that would leave the king in check
    # (This is simplified and doesn't fully implement check validation)
    
    # Check if destination is empty or has an enemy piece
    board[end_pos].nil? || enemy?(board[end_pos])
  end
  
  # Castle movement would be implemented here in a complete chess game
  # We're omitting it for simplicity now
end