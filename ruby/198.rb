# @param {Integer[]} nums
# @return {Integer}
def rob(nums, dist: 2)
  dp = [0] * dist
  nums.each_with_index do |num, idx|
    dp[idx % dist] = [dp[idx % dist] + num, dp[idx % dist - 1]].max
  end
  
  dp[nums.size % dist - 1]
end