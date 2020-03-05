# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  board.each_with_index do |row, i|
    row.each_with_index do |val, j|
      next if val <= 0

      (i-1..i+1).each do |i2|
        (j-1..j+1).each do |j2|
          next if off_board?(board, i2, j2)

          board[i2][j2] += (board[i2][j2] > 0) ? 1 : -1
        end
      end
    end
  end
  
  live = [-3, 4, 5]
  board.each_with_index do |row, i|
    row.each_with_index do |val, j|
      board[i][j] = live.include?(val) ? 1 : 0
    end
  end
end
          
private def off_board?(board, i, j)
  i < 0 || j < 0 || i >= board.size || j >= board[i].size
end