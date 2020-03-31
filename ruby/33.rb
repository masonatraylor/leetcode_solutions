# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  pivot = nums.bsearch_index { |i| i < nums.first } || 0
  idx = (pivot - nums.size...pivot).bsearch { |i| nums[i] >= target } || 0
  nums[idx] == target ? idx % nums.size : -1
end