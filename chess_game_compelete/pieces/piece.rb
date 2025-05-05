class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(color, pos = nil)
    @color = color # :white or :black
    @pos = pos
  end

  def valid_move?(end_pos, board)
    # Default implementation - pieces can't move by default
    false
  end

  def symbol
    # This should be overridden by each piece subclass
    "?"
  end

  def to_s
    symbol
  end

  def enemy?(other_piece)
    other_piece && other_piece.color != color
  end
end