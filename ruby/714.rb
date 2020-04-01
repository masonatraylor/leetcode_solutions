# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
  min = prices.first
  prices.sum do |p|
    gain = [p - min - fee, 0].max
    if gain.positive?
      min = p - fee
    else
      min = p if p < min
    end
    gain
  end
end