class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0
    current_node = @head
    while current_node
      count += 1
      current_node = current_node.next_node
    end
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
  end

  def pop
    current_node = @head
    while current_node.next_node != @tail
      current_node = current_node.next_node
    end
    current_node.next_node = nil
    @tail = current_node
  end

  def contains?(value)
    current_node = @head
    while current_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node
      return index if current_node.value == value
      current_node = current_node.next_node
    end
  end

  def to_s
    current_node = @head
    while current_node
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    puts "nil"
  end

  def insert_at(value, index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value, current_node.next_node)
  end

  def remove_at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.next_node = current_node.next_node.next_node
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end