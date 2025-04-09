def sum_scores(scores)
  sum = 0
  scores.each do |score|
    sum = sum += score
  end
  sum
end

score = [1, 3, 500, 1, 10]
p sum_scores(score)
