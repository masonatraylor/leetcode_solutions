# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  median((nums1 + nums2).sort)
end
    
private def median(list)
  if list.size.odd?
    list[list.size / 2].to_f
  else
    (list[list.size / 2] + list[list.size / 2 - 1])/2.0
  end
end