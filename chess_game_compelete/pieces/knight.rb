require_relative 'piece'

class Knight < Piece
  def symbol
    color == :white ? "♘" : "♞"
  end
  
  def valid_moves(end_pos, board)
    return false unless board.valid_position?(end_pos)

    row, col = pos
    end_row, end_col = end_pos

    row_diff = (row - end_row).abs
    col_diff = (col - end_col).abs

    valid_moves = (row_diff == 2 && col_diff == 1) || (row_diff == 1 && col_diff == 2)

    valid_move &&  (board[end_pos].nil? || enemy?(board[end_pos]))
  end
end