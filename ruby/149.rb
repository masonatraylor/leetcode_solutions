# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
  return points.size if points.size <= 2
  
  max = 0
  lines = Hash.new(0)
  points[0..-2].each_with_index do |current, i|
    break if max >= points.size - i
    
    lines.clear
    my_point_count = 1
    points[i+1..-1].each do |point|
      if point == current
        my_point_count += 1
        next
      end
      
      y_dif = point[1] - current[1]
      x_dif = point[0] - current[0]
      gcd = gcd(y_dif, x_dif)
      y_dif /= gcd if gcd != 0
      x_dif /= gcd if gcd != 0
      lines[[x_dif, y_dif]] += 1
    end
    max = [max, (lines.values.max || 0) + my_point_count].max
  end
  
  max
end
  
private def gcd(x, y)
  return y if x == 0
  gcd(y % x, x)
end