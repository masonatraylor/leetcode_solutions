# @param {Integer[]} calories
# @param {Integer} k
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def diet_plan_performance(calories, k, lower, upper)
  sum = calories[0, k].sum
  score = sum_to_point(sum, lower, upper)
  (calories.size - k).times do |i|
    sum += calories[k + i] - calories[i]
    score += sum_to_point(sum, lower, upper)
  end
  
  score
end

private def sum_to_point(sum, lower, upper)
  return -1 if sum < lower
  return 1 if sum > upper
  return 0
end