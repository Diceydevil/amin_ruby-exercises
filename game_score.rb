# Story: You're tallying points for a player's game session. Each level of the game gives a certain score, and you want to find the total score.
# Problem: Write a method sum_scores(scores) that takes an array of numbers (each number is the score from a level) and returns the total sum of all scores. Use a loop (like .each or for) to accumulate the sum.

def sum_scores(scores)
  scores.sum { |score| score }
end

score = [1, 3, 5, 1]
puts sum_scores(score)
