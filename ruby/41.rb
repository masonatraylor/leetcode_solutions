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

  # Ruby 2.6 would allow (1..).each {...}
  (1..2**31).each { |i| return i if nums[i - 1] != i }
end