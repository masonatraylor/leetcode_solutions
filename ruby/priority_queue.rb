class PriorityQueue
  def initialize(&comp)
    # Defaults to a min heap
    @comp = comp || -> (a, b) { a < b }
    @arr = [nil]
  end
  
  def offer(item)
    index = @arr.size
    
    while index > 1 && @comp.call(item, @arr[index / 2])
      @arr[index] = @arr[index / 2]
      index /= 2
    end
    
    @arr[index] = item
  end
  
  def empty?
    @arr.size == 1
  end
  
  def poll
    return nil if empty?
    
    result = @arr[1]
    last = @arr.pop
    @arr[1] = last unless empty?
    bubble_down(1)
    result
  end
  
  private def bubble_down(idx)
    loop do
      next_idx = idx * 2
      next_idx += 1 if next_idx + 1 < @arr.size && @comp.call(@arr[next_idx + 1], @arr[next_idx])

      return if next_idx >= @arr.size || @comp.call(@arr[idx], @arr[next_idx])
      
      swap(idx, next_idx)
      idx = next_idx
    end
  end
  
  private def swap(idx1, idx2)
    tmp = @arr[idx1]
    @arr[idx1] = @arr[idx2]
    @arr[idx2] = tmp
  end
  
  def peek_n(n)
    result = []
    pq = PriorityQueue.new { |a, b| @comp.call(@arr[a], @arr[b]) }
    pq.offer(1) unless empty?
    
    n.times do
      break if pq.empty?
      
      idx = pq.poll
      result << @arr[idx]
      
      pq.offer(idx * 2) if idx * 2 < @arr.size
      pq.offer(idx * 2 + 1) if idx * 2 + 1 < @arr.size
    end
    
    result
  end
end

pq = PriorityQueue.new { |a, b| a < b }

100.times { |i| pq.offer(i) }

100.times { p pq.poll }