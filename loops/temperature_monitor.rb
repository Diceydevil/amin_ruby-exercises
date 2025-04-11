# 5. Temperature Monitor 🌡️
# Story: You're coding a weather station that monitors temperatures each day. You want to detect the first freezing day. (Assume freezing is below 0°C for this exercise.)
# Problem: Write a method first_freezing_day(temperatures) that takes an array of daily temperature readings (integers).
# Loop through the array to find the first temperature that is below 0. Return that temperature (or its index, if you prefer) and stop checking further once you find it.
# If none of the temperatures are below zero, return nil or a message indicating no freezing day.

temperatures = [1, 5, 10, 20, -4, 54, -3, 5, -4, 0, -2]

def first_freezing_day(temperatures)
  temperatures.each_with_index do |temperature, index|
    if temperature < 0
      return "The first temperture is #{temperature}! and the index is #{index}"
    end
  end
end

puts first_freezing_day(temperatures)
