# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  profits  = PriorityQueue.new { |a, b| a > b }
  n = prices.size
  vp_stack = []
  
  p2 = -1
  while p2 < n - 2
    v2 = (p2+1...n-1).detect { |i| prices[i] < prices[i + 1] }
    break if v2.nil?
    
    p2 = (v2+1...n).detect { |i| i == n - 1 || prices[i] > prices[i + 1] }
    
    until vp_stack.empty? || prices[v2] >= prices[vp_stack.last.first]
      v1, p1 = vp_stack.pop
      profits.offer(prices[p1] - prices[v1])
    end
    
    until vp_stack.empty? || prices[p2] < prices[vp_stack.last.last]
      v1, p1 = vp_stack.pop
      profits.offer(prices[p1] - prices[v2])
      v2 = v1
    end
    
    vp_stack << [v2, p2]
  end
  
  until vp_stack.empty?
    v1, p1 = vp_stack.pop
    profits.offer(prices[p1] - prices[v1])
  end
  
  profits.first(k).sum
end

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
  
  def first(n)
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