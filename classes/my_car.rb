class MyCar < Vehicle
  attr_accessor :type
  TYPE = "Car"
  include Driftable

  def initialize(year, colour, model)
    super
    @type = TYPE
  end

  def to_s
    "Your #{year} #{type} #{model}, is going #{current_speed} mph."
  end
end
