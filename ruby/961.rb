# @param {Integer[]} a
# @return {Integer}
def repeated_n_times(a)
  random = Random.new
  loop do
    i1, i2 = random.rand(a.size), random.rand(a.size)
    return a[i1] if a[i1] == a[i2] && i1 != i2
  end
end