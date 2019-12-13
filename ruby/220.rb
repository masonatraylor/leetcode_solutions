# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  buckets = {}
  
  nums.each_with_index do |num, i|
    id = bucket_id(num, t)
    (id-1..id+1).each do |search|
      return true if buckets.key?(search) && (buckets[search] - num).abs <= t
    end
    
    buckets[id] = num
    buckets.delete(bucket_id(nums[i - k], t)) if i >= k
  end
  
  false
end

private def bucket_id(num, t)
  t.zero? ? num : num / t
end
