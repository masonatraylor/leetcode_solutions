# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict, word_set: word_dict.to_set)
  dp = [true] + [false] * s.size
  
  (1..s.size).each do |i|
    (i - 1).downto(0).each do |j|
      dp[i] ||= dp[j] && word_set.include?(s[j...i])
    end
  end
  
  dp.last
end