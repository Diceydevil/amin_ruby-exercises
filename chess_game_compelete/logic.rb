class GameLogic
  attr_reader :board, :current_player, :game_over

  def initialize
    @board = Board.new
    @current_player = :white
    @game_over = false
    @check_status = { white: false, black: false }
  end

  def switch_player
    @current_player = (@current_player == :white) ? :black : :white
  end

  def make_move(start_pos, end_pos)
    piece = @board[start_pos]
    
    # Basic validations
    return false if piece.nil?
    return false if piece.color != @current_player
    
    # Check move validity
    valid = @board.move_piece(start_pos, end_pos)
    
    if valid
      # Check for check status
      @check_status[:white] = @board.in_check?(:white)
      @check_status[:black] = @board.in_check?(:black)
      
      # Check for checkmate
      if @check_status[@current_player == :white ? :black : :white]
        if checkmate?(@current_player == :white ? :black : :white)
          @game_over = true
        end
      end
      
      # Switch players
      switch_player
    end
    
    valid
  end

  def in_check?(color)
    @check_status[color]
  end

  def checkmate?(color)
    return false unless @check_status[color]
    
    # For each piece of the given color
    @board.grid.each_with_index do |row, r|
      row.each_with_index do |piece, c|
        next if piece.nil? || piece.color != color
        
        # For each position on the board
        8.times do |end_r|
          8.times do |end_c|
            end_pos = [end_r, end_c]
            
            # If the piece can make a valid move
            if piece.valid_move?(end_pos, @board)
              # Try the move
              old_piece = @board[end_pos]
              @board[end_pos] = piece
              @board[[r, c]] = nil
              
              # If the move takes the king out of check
              in_check = @board.in_check?(color)
              
              # Undo the move
              @board[[r, c]] = piece
              @board[end_pos] = old_piece
              
              # If any move can get out of check, it's not checkmate
              return false unless in_check
            end
          end
        end
      end
    end
    
    # If no move can get out of check, it's checkmate
    true
  end

  def stalemate?
    # Similar to checkmate? but checks when a player is not in check
    # but has no legal moves
    # We'll leave this as an exercise
    false
  end
end
