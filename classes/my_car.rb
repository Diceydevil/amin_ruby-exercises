# Create a class called MyCar.
# When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car.
# Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well.
# Create instance methods that allow the car to speed up, brake, and shut the car off.
#
# Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.
#
# Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
# Override the to_s method to create a user friendly print out of your object.
#
# When running the following code...
#
# class Person
# attr_reader :name
# def initialize(name)
#   @name = name
# end
# end
#
# bob = Person.new("Steve")
# bob.name = "Bob"
#
# We get the following error...
# test.rb:9:in `<main>': undefined method `name=' for
# <Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
#
# Why do we get this error and how do we fix it?

class MyCar
  attr_accessor :year, :colour
  attr_reader :model

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @speed = 0
  end

  def to_s
    "Your #{year} #{model}, is going #{current_speed} mph."
  end

  def self.gas_mileage_calculator(distance, fuel_used)
    mpg = distance / fuel_used.to_f
    puts "the #{@model}, consumption is #{mpg} miles per gallon"
  end

  def speed_up(amount)
    @speed += amount
  end

  def current_speed
    "The current speed is #{@speed}"
  end

  def brake(amount)
    @speed -= amount
    @speed = 0 if speed < 0
  end

  def current_colour
    puts "the current colour is #{colour}"
    puts "do you want to change the colour?"
    answer = gets.chomp
    if answer == "Yes"
      puts "Give the new colour:"
      new_colour = gets.chomp
      @colour = new_colour
    else
      puts "cool!, if you want a new colour, just say 'Yes' next time and I am all yours!"
    end
  end

  def view_model
    "Model of the car is #{@model}"
  end

  def turn_engine
    "Here you can turn on/off..."
  end
end
