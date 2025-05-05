class Player
  attr_reader :color, :name

  def initialize(name, color)
    @name = name
    @color = color
  end

  def get_move
    puts "#{@name} (#{@color}), enter your move (e.g. 'e2 e4'):"
    input = gets.chomp
    
    # Parse the input into board coordinates
    # Remove any quotes that might be entered
    input = input.gsub(/['"]/, '')
    start_str, end_str = input.split
    
    # Convert chess notation to array indices
    # e.g., "e2" becomes [6, 4]
    start_pos = convert_notation(start_str)
    end_pos = convert_notation(end_str)
    
    [start_pos, end_pos]
  end
  
  private
  
  def convert_notation(notation)
    return nil unless notation && notation.length == 2
    
    col = notation[0].ord - 'a'.ord
    row = 8 - notation[1].to_i
    
    [row, col]
  end
end