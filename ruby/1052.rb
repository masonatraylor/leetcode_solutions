# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} x
# @return {Integer}
def max_satisfied(customers, grumpy, x)
  x_satisfied = 0
  max_x_satisfied = 0
  regular_satisfied = 0
  customers.each_with_index do |i, idx|
    if grumpy[idx].zero?
      regular_satisfied += i
    else
      x_satisfied += i
    end
    
    x_satisfied -= customers[idx - x] if idx >= x && grumpy[idx - x] == 1
    
    max_x_satisfied = [max_x_satisfied, x_satisfied].max
  end
  
  max_x_satisfied + regular_satisfied
end