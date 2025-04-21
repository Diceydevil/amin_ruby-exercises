# Board class to set the board for the tic tac toe one initialising the game
class Board
  WIN_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  def initialize
    @cells = Array.new(9, " ")   # index 0 corresponds to position 1
  end

  def display
    puts %(
     #{@cells[0]} | #{@cells[1]} | #{@cells[2]}
    ---+---+---
     #{@cells[3]} | #{@cells[4]} | #{@cells[5]}
    ---+---+---
     #{@cells[6]} | #{@cells[7]} | #{@cells[8]}
    )
  end

  def mark(position, symbol)
    @cells[position - 1] = symbol
  end

  def taken_positions
    @cells.map.with_index { |c, i| i + 1 if c != " " }.compact
  end

  def winner?(symbol)
    WIN_LINES.any? { |line| line.all? { |pos| @cells[pos - 1] == symbol } }
  end

  def full?
    !@cells.include?(" ")
  end
end
