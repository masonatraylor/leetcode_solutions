class Receiver
  def initialize
    @pq = PriorityQueue.new
    @hash = {}
    @offset
  end

  def receive(data, offset)
    unless @hash.has_key?(offset)
      @hash[offset] = data
      @pq.offer(offset)
    else
      @hash[offset] = [@hash[offset], data].max_by(&:size)
    end
  end

  def send
    result = ''

    until @pq.empty? || @pq.peek > @offset
      current = @pq.poll
      data = @hash.delete(current)
      combine(result, data, current)
      @offset = [@offset, data.size + current].max
    end

    result
  end
end

