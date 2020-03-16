# @param {Integer[]} stations
# @param {Integer} k
# @return {Float}
def minmax_gas_dist(stations, k)
  distances = []
  (stations.size - 1).times do |i|
    distances << stations[i + 1] - stations[i]
  end
  
  step = guess = 10.0 ** 8
  while step > 10 ** -6
    step /= 2.0
    
    good_guess = distances.sum { |d| (d/guess).floor } <= k
    guess += step * (good_guess ? -1 : 1)
  end
  
  guess
end