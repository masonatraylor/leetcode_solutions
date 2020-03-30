class PriorityQueue
  def initialize(&comp)
    # Defaults to a min heap
    @comp = comp || -> (a, b) { a < b }
    @arr = []
  end
  
  def offer(item)
    index = @arr.size
    
    while index > 0 && @comp.call(item, @arr[(index - 1) / 2])
      @arr[index] = @arr[(index - 1) / 2]
      index = (index - 1) / 2
    end
    
    @arr[index] = item
  end
  
  def empty?
    @arr.empty?
  end
  
  def poll
    result = @arr.first
    last = @arr.pop
    
    return result if @arr.empty?
    
    idx = 0
    @arr[0] = last
    loop do
      next_idx = idx * 2 + 1
      next_idx += 1 if next_idx + 1 < @arr.size && @comp.call(@arr[next_idx + 1], @arr[next_idx])

      return result if next_idx >= @arr.size || @comp.call(@arr[idx], @arr[next_idx])
      
      tmp = @arr[idx]
      @arr[idx] = @arr[next_idx]
      @arr[next_idx] = tmp
      idx = next_idx
    end
  end
end

pq = PriorityQueue.new { |a, b| a < b }

100.times { |i| pq.offer(i) }

100.times { p pq.poll }