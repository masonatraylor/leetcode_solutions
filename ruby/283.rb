# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  slow = 0
  fast = 0
  
  while slow < nums.size
    fast += 1 while nums[fast]&.zero?
    
    nums[slow] = nums[fast] || 0 unless slow == fast
    
    slow += 1
    fast += 1
  end
    
  nums
end