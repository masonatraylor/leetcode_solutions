# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  window = []
  result = []

  nums.each_index do |i|
    window.pop until window.empty? || nums[window.last] > nums[i]
    window << i
    window.shift if window.first <= i - k

    result << nums[window.first] if i >= k - 1
  end

  result
end
