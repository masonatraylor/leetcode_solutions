# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)

  i, j = 0, 0
  result = []
  while i < a.size && j < b.size
    start = [a[i].first, b[j].first].max
    finish = [a[i].last, b[j].last].min
    
    result << [start, finish] if start <= finish
    
    if finish == a[i].last
      i += 1
    else
      j += 1
    end
  end
  
  result
end