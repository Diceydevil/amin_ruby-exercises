def sum_scores(scores)
  sum = 0
  scores.each do |score|
    sum = sum += score
  end
  sum
end

score = [1, 3, 5, 1]
p sum_scores(score)
puts sum_scores(score)
