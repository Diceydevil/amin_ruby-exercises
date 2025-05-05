require_relative 'piece'

class Rook < Piece
  def symbol
    color == :white ? "♖" : "♜"
  end

  def valid_move?(end_pos, board)
    return false unless board.valid_position?(end_pos)
    
    row, col = pos
    end_row, end_col = end_pos
    
    # Rooks move horizontally or vertically
    return false unless row == end_row || col == end_col
    
    # Check path for obstacles
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
    
    # Check if destination is empty or has an enemy piece
    board[end_pos].nil? || enemy?(board[end_pos])
  end
  
  private
  
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
