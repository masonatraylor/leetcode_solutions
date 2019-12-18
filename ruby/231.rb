# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  n > 0 && n == 2 ** Math.log(n, 2).round
end