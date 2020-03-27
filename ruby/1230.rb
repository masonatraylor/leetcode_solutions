# @param {Float[]} prob
# @param {Integer} target
# @return {Float}
def probability_of_heads(prob, target)
  probs = [1] + [0] * (target + 1)
  
  prob.each do |p|
    (0..target).reverse_each do |idx|
      probs[idx] = probs[idx] * (1 - p) + probs[idx - 1] * p
    end
  end
  
  probs[target]
end