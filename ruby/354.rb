# @param {Integer[][]} envelopes
# @return {Integer}
def max_envelopes(envelopes)
  heights = envelopes.sort_by { |e| [e[0], -e[1]] }.map(&:last)
  
  longest_increasing_subsequence(heights).size
end

def longest_increasing_subsequence(arr)
  dp = []
  
  arr.each do |i|
    idx = dp.bsearch_index { |j| j >= i } || dp.size
    dp[idx] = i
  end
  
  dp
end