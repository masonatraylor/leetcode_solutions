class DinnerPlates
  def initialize(capacity)
    @capacity = capacity

    @stacks = []
    @open = PriorityQueue.new
  end

  def push(val)
    idx = @open.peek 

    # No open stacks registered
    if idx.nil? || @stacks[idx].nil?
      idx ||= @stacks.size
      @stacks[idx] = []
      @open.offer(idx)
    end

    @stacks[idx] << val

    @open.poll if @stacks[idx].size == @capacity
  end

  def pop()
    pop_at_stack(@stacks.size - 1)
  end

  def pop_at_stack(index)
    stack = @stacks[index]
    return -1 if stack.nil? || stack.empty?

    # Open for business
    @open.offer(index) if stack.size == @capacity
    result = stack.pop

    while @stacks.last&.empty?
      @stacks.pop
      @open.remove(@stacks.size)
    end

    result
  end
end








class PriorityQueue
  def initialize(&comp)
    @hash = {}
    
    # Defaults to a min heap
    @comp = comp || -> (a, b) { a < b }
    @arr = [nil]
  end
  
  def offer(item)
    index = @arr.size
    @arr << item
    @hash[item] = index
    
    while index > 1 && @comp.call(item, @arr[index / 2])
      swap(index, index / 2)
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
  
  def peek
    @arr[1]
  end
  
  def remove(item)
    idx = @hash[item]
    return false if idx.nil?
    
    @arr[idx] = @arr.last
    @arr.pop
    bubble_down(idx)
    @hash.delete(item)
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
    val1 = @arr[idx1]
    val2 = @arr[idx2]
    @hash[val1] = idx2
    @hash[val2] = idx1
    @arr[idx1] = val2
    @arr[idx2] = val1
  end
end