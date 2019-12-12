# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  dp = create_dp_array(word1.size + 1, word2.size + 1)
  
  word1.chars.each_with_index do |c1, i1|
    word2.chars.each_with_index do |c2, i2|
      if c1 == c2
        dp[i1 + 1][i2 + 1] = dp[i1][i2]
      else
        dp[i1 + 1][i2 + 1] = 1 + [dp[i1 + 1][i2],
                                  dp[i1][i2 + 1],
                                  dp[i1][i2]].min
      end
    end
  end
  
  dp[-1][-1]
end

private def create_dp_array(height, width)
  dp = Array.new(height) { Array.new(width) }
  
  height.times { |i| dp[i][0] = i }
  width.times  { |i| dp[0][i] = i }
  
  dp
end