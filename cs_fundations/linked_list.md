You will need two classes:

LinkedList class, which will represent the full list.
Node class, containing two instance variables, #value and #next_node, set both as nil by default.
Build the following methods in your linked list class:

#append(value) adds a new node containing value to the end of the list
#prepend(value) adds a new node containing value to the start of the list
#size returns the total number of nodes in the list
#head returns the first node in the list
#tail returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
Extra credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

Test it out
Let’s test out the Linked List you made!

Create a main.rb file and make sure it requires the file containing LinkedList. This is where we’ll test the list.

Create an instance of LinkedList and populate it with nodes:

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
Add puts list to the end of the file and run it. Because of the naming, this should use the #to_s method you wrote earlier.

If everything is working, the output should be ( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil. Feel free to use different values to test if you like.