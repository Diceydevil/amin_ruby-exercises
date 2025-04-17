# Create a BaseballPlayer class that is initialized with hits, walks, and at_bats.
# Add a batting_average() method that returns hits divided by at_bats as a floating point number.
# Add an on_base_percentage() method that returns (hits + walks) divided by at_bats as a floating point number.
# Demonstrate how the batting_average() and on_base_percentage() methods can be used.

class BaseballPlayer
  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average
    (@hits.to_f / @at_bats)
  end

  def on_base_percentage
    ((hits + walks).to_f / at_bats)
  end
end
