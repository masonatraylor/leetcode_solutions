# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  slow = fast = 0
  loop do
    slow = nums[slow]
    fast = nums[nums[fast]]
    break if slow == fast
  end
  
  slow = 0
  until slow == fast
    slow = nums[slow]
    fast = nums[fast]
  end
  slow
end