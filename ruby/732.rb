class MyCalendarThree
  def initialize()
    @bookings = [[0, 0]]
    @max = 0
  end

=begin
    :type start: Integer
    :type end: Integer
    :rtype: Integer
=end
  def book(start, finish)
    idx = @bookings.bsearch_index { |i| i.first >= start } || @bookings.size
    
    unless @bookings[idx]&.first == start
      @bookings.insert(idx, [start, @bookings[idx - 1].last])
    end
    
    while idx < @bookings.size && @bookings[idx].first < finish
      k = @bookings[idx].last + 1
      @bookings[idx][-1] = k
      @max = [@max, k].max
      idx += 1
    end
    
    unless @bookings[idx]&.first == finish
      @bookings.insert(idx, [finish, @bookings[idx - 1].last - 1])
    end
    
    @max
  end
end

# Your MyCalendarThree object will be instantiated and called as such:
# obj = MyCalendarThree.new()
# param_1 = obj.book(start, end)