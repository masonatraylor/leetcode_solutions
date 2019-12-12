# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  nums = nums.to_set
  longest = 0
  
  nums.each do |i|
    next if nums.include?(i - 1)
    
    j = i + 1
    j += 1 while nums.include?(j)
    
    longest = j - i if j - i > longest
  end
  
  longest
end