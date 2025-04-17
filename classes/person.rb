# Create a Person class that is initialized with an age and create an age=() method that can be used to update the @age instance variable.
# Also include an age method that returns the value of the @age instance variable.
# Demonstrate how the methods can be used.

class Person
  attr_accessor :age

  def initialize(age)
    @age = age
  end

  attr_writer :age

  attr_reader :age
end
