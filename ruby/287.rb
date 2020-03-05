# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  nums.each_with_index do |num, i|
    while num != nums[num]
      nums[i] = nums[num]
      nums[num] = num
      num = nums[i]
    end
  end
  
  nums[0]
end