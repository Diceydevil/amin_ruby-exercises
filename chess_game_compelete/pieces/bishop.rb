require_relative 'piece'

class Bishop < Piece
  def symbol
    color == :white ? "♗" : "♝"
  end

  def valid_move?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    # Check if the move is diagonal
    return false unless (row - end_row).abs == (col - end_col).abs
    
    # Check path for obstacles
    return false unless clear_diagonal_path?(end_pos, board)
    
    # Check if destination is empty or has an enemy piece
    board[end_pos].nil? || enemy?(board[end_pos])
  end
  
  private
  
  def clear_diagonal_path?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    # Determine direction
    row_dir = end_row > row ? 1 : -1
    col_dir = end_col > col ? 1 : -1
    
    # Check each square in the path
    curr_row, curr_col = row + row_dir, col + col_dir
    while curr_row != end_row && curr_col != end_col
      return false unless board[[curr_row, curr_col]].nil?
      curr_row += row_dir
      curr_col += col_dir
    end
    
    true
  end
end
