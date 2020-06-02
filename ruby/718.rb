# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  max = 0
  dp = [0] * (a.size + 1)
  
  a.each_index do |a_i|
    b.each_index.reverse_each do |b_i|
      if a[a_i] == b[b_i]
        dp[b_i] = dp[b_i - 1] + 1
        max = dp[b_i] if dp[b_i] > max
      else
        dp[b_i] = 0
      end
    end
  end
  
  max
end