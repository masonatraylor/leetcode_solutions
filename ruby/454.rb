# @param {Integer[]} a
# @param {Integer[]} b
# @param {Integer[]} c
# @param {Integer[]} d
# @return {Integer}
def four_sum_count(a, b, c, d)
  map = Hash.new(0)
  
  a.each do |x|
    b.each do |y|
      map[x + y] += 1
    end
  end
  
  c.sum do |x|
    d.sum do |y|
      map[-x - y]
    end
  end
end