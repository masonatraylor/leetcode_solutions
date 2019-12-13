# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
  (0...nums.size - 2).count { |i| nums[i] > nums[i + 2] } < 2 &&
    (0...nums.size - 1).count { |i| nums[i] > nums[i + 1] } < 2
end