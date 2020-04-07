# @param {Integer} n
# @return {Integer}
def count_orders(n)
  (0...n).reduce(1) do |product, i|
    product * sum_0_to_n(count_from(i)) % 1_000_000_007
  end
end
    
private def count_from(i)
  i * 2 + 1
end
    
private def sum_0_to_n(n)
  n * (n + 1) / 2
end