# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def shortest_subarray(a, k)
  b = [0]
  a.each {|i| b << b[-1] + i}
  
  result = a.size + 1
  monoq = []
  b.each_with_index do |bi, i|
    monoq.pop until monoq.empty? || bi > b[monoq[-1]]
    result = [result, i - monoq.shift].min until monoq.empty? || bi - b[monoq[0]] < k
    monoq << i
  end
  
  result < a.size + 1 ? result : -1
end
