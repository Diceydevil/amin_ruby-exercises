require_relative 'piece'

class Queen < Piece
  def symbol
    color == :white ? "♕" : "♛"
  end

  def valid_move?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    # Queen combines rook and bishop movements
    is_diagonal = (row - end_row).abs == (col - end_col).abs
    is_straight = row == end_row || col == end_col
    
    return false unless is_diagonal || is_straight
    
    # Check for clear path
    if is_diagonal
      return false unless clear_diagonal_path?(end_pos, board)
    else # is_straight
      return false unless clear_straight_path?(end_pos, board)
    end
    
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
  
  def clear_straight_path?(end_pos, board)
    row, col = pos
    end_row, end_col = end_pos
    
    if row == end_row # Horizontal move
      start_col, end_col = [col, end_col].sort
      (start_col + 1...end_col).each do |c|
        return false unless board[[row, c]].nil?
      end
    else # Vertical move
      start_row, end_row = [row, end_row].sort
      (start_row + 1...end_row).each do |r|
        return false unless board[[r, col]].nil?
      end
    end
    
    true
  end
end
