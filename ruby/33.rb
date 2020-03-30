# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  pivot = nums.bsearch_index { |i| i < nums.first } || 0
  [(0...pivot), (pivot...nums.size)].each do |range|
    idx = nums[range].bsearch_index { |i| i >= target } || 0
    return idx + range.first if nums[idx + range.first] == target
  end
  
  -1
end