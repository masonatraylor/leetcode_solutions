# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}
  nums.each_with_index do |i, idx|
    return [map[i], idx] if map.has_key?(i)
    
    map[target - i] = idx
  end
end