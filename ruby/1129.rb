# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
  edge_map_array = []
  
  [red_edges, blue_edges].each do |edges|
    map = Hash.new { |h, k| h[k] = [] }
    edges.each { |from, to| map[from] << to }
    edge_map_array << map
  end
  
  result = [-1] * n
  bfs(edge_map_array, result)
  bfs(edge_map_array.rotate, result)
end

private def bfs(edge_map_array, result)
  queue = [[0, 0, 0]]
  seen = Set[]
  
  until queue.empty?
    color, node, length = queue.pop
    next unless seen.add?([color, node])
    
    result[node] = length if result[node] < 0 || length < result[node]
    
    edge_map_array[color][node].each do |next_node|
      queue.unshift([1 - color, next_node, length + 1])
    end
  end
  
  result
end