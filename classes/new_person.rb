# Create a Person class that is initialized with a first_name and last_name.
# Create first_name() and last_name() methods that return the values of the corresponding instance variables.
# Create a full_name() method that concatenates the first_name and last_name in a single string.

class NewPerson
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end
