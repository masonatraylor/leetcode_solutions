class PriorityQueue
  def initialize
    @array = []
  end
  
  def offer(item)
    index = @array.size
    
    while index > 0 && @array[(index - 1) / 2] < item
      @array[index] = @array[(index - 1) / 2]
      index = (index - 1) / 2
    end
    
    @array[index] = item
  end
  
  def empty?
    @array.empty?
  end
  
  def poll
    result = @array.first
    last = @array.pop
    
    return result if @array.empty?
    
    index = 0
    @array[0] = last
    loop do
      replacements = [index * 2 + 1, index * 2 + 2]
      replacements.select! { |i| i < @array.size }
      max = replacements.max_by { |i| @array[i] }
      
      return result if max.nil? || @array[max] < @array[index]
      
      tmp = @array[index]
      @array[index] = @array[max]
      @array[max] = tmp
      index = max
    end
  end
end

# @param {Integer} target
# @param {Integer} start_fuel
# @param {Integer[][]} stations
# @return {Integer}
def min_refuel_stops(target, fuel, stations)
  pq = PriorityQueue.new
  i = 0  
  
  0.step do |refills|
    return refills if fuel >= target
    
    while i < stations.size && stations[i].first <= fuel
      pq.offer(stations[i].last)
      i += 1
    end
    
    return -1 if pq.empty?
    
    fuel += pq.poll
  end
end