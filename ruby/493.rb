# @param {Integer[]} nums
# @return {Integer}
def reverse_pairs(nums)
  pairs = 0
  sorted = []
  
  nums.reverse_each do |num|
    idx = sorted.bsearch_index { |i| i * 2 < num } || sorted.size
    pairs += sorted.size - idx
    
    idx = sorted.bsearch_index { |i| i <= num } || sorted.size
    sorted.insert(idx, num)
  end
  
  pairs
end
