# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  nums.each_with_index do |num, i|
    while num > 0 && num <= nums.size && num != nums[num - 1]
      nums[i] = nums[num - 1]
      nums[num - 1] = num
      num = nums[i]
    end
  end

  1.step { |i| return i if nums[i - 1] != i }
end