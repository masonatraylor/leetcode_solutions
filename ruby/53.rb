# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  sum = max = -1.0/0

  nums.each do |i|
    sum = [i, sum + i].max
    max = [sum, max].max
  end

  max
end