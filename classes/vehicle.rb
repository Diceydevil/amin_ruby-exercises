class Vehicle
  @@number_of_objects = 0

  attr_accessor :year, :colour
  attr_reader :model

  def initialize(year, colour, model)
    @year = year
    @colour = colour
    @model = model
    @speed = 0
    @@number_of_objects += 1
  end

  def speed_up(amount)
    @speed += amount
  end

  def self.number_of_objects
    @@number_of_objects
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

  def self.gas_mileage_calculator(distance, fuel_used)
    mpg = distance / fuel_used.to_f
    puts "Consumption is #{mpg} miles per gallon"
  end

  def current_speed
    "The current speed is #{@speed}"
  end

  def view_model
    "Model of the car is #{@model}"
  end

  def turn_engine
    "Here you can turn on/off..."
  end

  def age
    calculate_age
  end

  private

  def calculate_age
    age = Time.now.year - @year
  end
end

# Create a class 'Student' with attributes name and grade.
# Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...
