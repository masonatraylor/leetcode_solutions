# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  (1...prices.size).sum { |idx| [prices[idx] - prices[idx - 1], 0].max }
end