# @param {Integer} n
# @return {Integer}
def num_trees(n)
  (0...n).reduce(1) { |prod, i| prod * 2 * (2 * i + 1) / (i + 2) }
end