# @param {Integer} k
# @param {Integer} n
# @return {Integer}
def super_egg_drop(k, n)
  dp = Array.new(k + 1, 0)
  m = 0
  while dp[[k, m].min] < n
    m += 1
    k.downto(1) do |i|
      dp[i] += dp[i - 1] + 1;
    end
  end
  m
end