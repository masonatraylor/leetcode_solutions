# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  dp = Array.new(text1.size) { Array.new(text2.size + 1, 0) }
  
  text1.each_char.with_index do |c1, i1|
    text2.each_char.with_index do |c2, i2|
      if c1 == c2
        dp[i1][i2] = dp[i1-1][i2-1] + 1
      else
        dp[i1][i2] = [dp[i1-1][i2], dp[i1][i2-1]].max
      end      
    end
  end
  
  dp[-1][-2]
end
