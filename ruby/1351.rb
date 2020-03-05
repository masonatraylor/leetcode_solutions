# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  col = grid[0].size
  
  grid.sum do |row|
    col -= 1 until col == 0 || row[col - 1] >= 0
    row.size - col
  end
end