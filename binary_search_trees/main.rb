require_relative 'tree'
require_relative 'node'

# Create a binary search tree from an array of random numbers
array = Array.new(15) { rand(1..100) }
tree = Tree.new(array)

# Confirm that the tree is balanced
puts "Is the tree balanced? #{tree.balanced?}"

# Print out all elements in different orders
puts "\nLevel order traversal:"
p tree.level_order

puts "\nPreorder traversal:"
p tree.preorder

puts "\nPostorder traversal:"
p tree.postorder

puts "\nInorder traversal:"
p tree.inorder

# Unbalance the tree by adding several numbers > 100
puts "\nAdding numbers > 100 to unbalance the tree..."
[101, 102, 103, 104, 105].each { |num| tree.insert(num) }

# Confirm tree is unbalanced
puts "Is the tree balanced? #{tree.balanced?}"

# Rebalance the tree
puts "\nRebalancing tree..."
tree.rebalance

# Confirm tree is balanced again
puts "Is the tree balanced? #{tree.balanced?}"

# Print all elements again
puts "\nLevel order traversal:"
p tree.level_order

puts "\nPreorder traversal:"
p tree.preorder

puts "\nPostorder traversal:"
p tree.postorder

puts "\nInorder traversal:"
p tree.inorder

puts "\nVisual representation of the tree:"
tree.pretty_print
