# @param {String} s
# @return {Integer}
def min_cut(s)
  cuts = (0...s.size).to_a
  pal = Array.new(s.size) { Array.new(s.size, false) }
  
  s.chars.each_with_index do |si, i|
    (0..i).each do |j|
      if si == s[j] && (j + 1 >= i - 1 || pal[j+1][i-1])
        pal[j][i] = true
        count = (j == 0) ? 0 : cuts[j-1] + 1
        cuts[i] = count if count < cuts[i]
      end
    end
  end
  
  cuts.last
end
