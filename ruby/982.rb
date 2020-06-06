# @param {Integer[]} a
# @return {Integer}
def count_triplets(a)
  counts = [0] * 65536
  
  a.each { |i| a.each { |j| counts[i&j] += 1 } }
  
  result = 0
  a.each do |i|
    j = 0
    while j < 65536
      if (i&j).zero?
        result += counts[j]
        j += 1
      else
        j += i&j
      end
    end
  end
  
  result
end