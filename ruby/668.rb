# @param {Integer} m
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(m, n, k)
  return find_kth_number(n, m, k) if n > m
  
  left, right = 0, m * n
  while left < right
    middle = (left + right) / 2
    
    if count_less_equal_to(m, n, middle) >= k
      right = middle
    else
      left = middle + 1
    end
  end
  
  left
end

def count_less_equal_to(m, n, k)
  (1..n).sum { |i| [k / i, m].min }
end