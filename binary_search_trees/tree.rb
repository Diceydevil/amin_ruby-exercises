class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return nil if array.empty?
    
    # Sort and remove duplicates
    array = array.sort.uniq
    
    mid = array.length / 2
    root = Node.new(array[mid])
    
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[(mid + 1)..-1])
    
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)
    return @root = Node.new(value) if @root.nil?

    current = @root
    while current
      if value < current.data
        if current.left.nil?
          current.left = Node.new(value)
          break
        end
        current = current.left
      else
        if current.right.nil?
          current.right = Node.new(value)
          break
        end
        current = current.right
      end
    end
  end

  def delete(value)
    return if @root.nil?

    parent = nil
    current = @root

    # Find the node to delete and its parent
    while current && current.data != value
      parent = current
      current = value < current.data ? current.left : current.right
    end

    return if current.nil? # Value not found

    # Case 1: Node has no children
    if current.left.nil? && current.right.nil?
      if parent.nil?
        @root = nil
      elsif parent.left == current
        parent.left = nil
      else
        parent.right = nil
      end

    # Case 2: Node has one child
    elsif current.left.nil?
      if parent.nil?
        @root = current.right
      elsif parent.left == current
        parent.left = current.right
      else
        parent.right = current.right
      end
    elsif current.right.nil?
      if parent.nil?
        @root = current.left
      elsif parent.left == current
        parent.left = current.left
      else
        parent.right = current.left
      end

    # Case 3: Node has two children
    else
      successor_parent = current
      successor = current.right
      
      # Find the smallest value in the right subtree
      while successor.left
        successor_parent = successor
        successor = successor.left
      end

      current.data = successor.data

      if successor_parent == current
        successor_parent.right = successor.right
      else
        successor_parent.left = successor.right
      end
    end
  end

  def find_min(node)
    current = node
    current = current.left until current.left.nil?
    current
  end

  def find(value)
    current = @root
    
    while current
      return current if current.data == value
      current = value < current.data ? current.left : current.right
    end
    
    nil
  end

  def level_order
    return [] if @root.nil?
    
    queue = [@root]
    result = []

    until queue.empty?
      node = queue.shift
      if block_given?
        yield node
      else
        result << node.data
      end
      
      queue << node.left if node.left
      queue << node.right if node.right
    end

    block_given? ? nil : result
  end

  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left, result, &block)
    
    if block_given?
      yield node
    else
      result << node.data
    end
    
    inorder(node.right, result, &block)
    
    result unless block_given?
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    if block_given?
      yield node
    else
      result << node.data
    end
    
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)
    
    result unless block_given?
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    
    if block_given?
      yield node
    else
      result << node.data
    end
    
    result unless block_given?
  end

  def height(value)
    node = find(value)
    return nil if node.nil?
    
    calculate_height(node)
  end

  def calculate_height(node)
    return -1 if node.nil?
    
    left_height = calculate_height(node.left)
    right_height = calculate_height(node.right)
    
    [left_height, right_height].max + 1
  end

  def find(value)
    current = @root
    
    while current
      return current if current.data == value
      current = value < current.data ? current.left : current.right
    end
    
    nil
  end

  def depth(value)
    return nil if @root.nil?
    
    current = @root
    depth = 0
    
    while current
      return depth if current.data == value
      
      if value < current.data
        current = current.left
      else
        current = current.right
      end
      
      depth += 1
    end
    
    nil
  end

  def balanced?
    check_balance(@root)
  end

  def check_balance(node)
    return true if node.nil?

    left_height = calculate_height(node.left)
    right_height = calculate_height(node.right)

    return false if (left_height - right_height).abs > 1
    
    check_balance(node.left) && check_balance(node.right)
  end

  def rebalance
    # Get all values in order
    values = inorder_values
    # Rebuild tree with sorted values
    @root = build_tree(values)
  end

  def inorder_values(node = @root, values = [])
    return values if node.nil?
    
    inorder_values(node.left, values)
    values << node.data
    inorder_values(node.right, values)
    
    values
  end
end