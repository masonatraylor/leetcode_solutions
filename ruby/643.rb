# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  sum = max = nums.first(k).sum
  
  nums[k..-1].each_with_index do |num, idx|
    sum += num - nums[idx]
    max = sum if sum > max
  end
  
  max / k.to_f
end