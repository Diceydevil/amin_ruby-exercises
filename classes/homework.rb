# Create a class called Homework and demonstrate how multiply_by_two() can be used.

module MathHelper
  def multiply_by_two(a)
    (a * 2)
  end
end

class HomeWork
  include MathHelper
  def initialize(student)
    @student = student
  end
end
