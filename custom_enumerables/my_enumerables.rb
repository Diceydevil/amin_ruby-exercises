module Enumerable
  def my_each_with_index
    index= 0
    self.my_each do |item|
      if block_given?
        yield(item, index)
        index += 1
      else
        puts "No block given"
      end
    end
  end

  def my_select
    selected_elements = []
    self.my_each do |item|
      if block_given?
        if yield(item)
          selected_elements << item
        end
      else
        puts "No block given"
      end
    end
    return selected_elements
  end

  def my_all?
    result = true

    self.my_each do |item|
      if block_given?
        unless yield(item)
          result = false
          break
        end
      else
        unless item
          result = false
          break
        end
      end
    end
    result
  end

  def my_any?
    result = false

    self.my_each do |item|
      if block_given?
        if yield(item)
          result = true
          break
        end
      end
    end
    result
  end

  def my_count
    count = 0

    self.my_each do |item|
      if block_given?
        if yield(item)
          count += 1
        end
      else
        count += 1
      end
    end
    count
  end

  def my_inject(initial = nil, symbol = nil)
    # Handle if a symbol is passed as the first argument
    if initial.is_a?(Symbol) && symbol.nil?
      symbol = initial
      initial = nil
    end
    
    # Convert to array to easily access elements
    array = self.to_a
    
    # If no initial value given, use first element
    if initial.nil?
      accumulator = array[0]
      start_index = 1  # Skip first element in iteration
    else
      accumulator = initial
      start_index = 0  # Include all elements
    end
    
    # Return early for empty arrays with initial value
    return accumulator if array.empty?
    
    # Main iteration logic
    (start_index...array.length).each do |i|
      if symbol
        # Use symbol as operation (e.g., :+, :-, :*)
        accumulator = accumulator.send(symbol, array[i])
      elsif block_given?
        # Use block as operation
        accumulator = yield(accumulator, array[i])
      end
    end
    
    accumulator
  end

  def my_map
    mapped_elements = []

    self.my_each do |item|
      if block_given?
        mapped_elements << yield(item)
      end
    end
    mapped_elements
  end
  
  def my_none?
    result = true

    self.my_each do |item|
      if block_given?
        if yield(item)
          result = false
          break
        end
      end
    end
    result
  end

  def my_one?
    result = false

    self.my_each do |item|
      if block_given?
        if yield(item)
          result = true
          break
        end
      end
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      if block_given?
        yield(item)
      else
        puts "No block given"
      end
    end
    self
  end
end
