# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  index_map = {}
  repeated_chars = Set[]
  
  s.chars.each_with_index do |c, i|
    next if repeated_chars.include?(c)
    
    if index_map.include?(c)
      repeated_chars << c
      index_map.delete(c)
    else
      index_map[c] = i
    end
  end
  
  index_map.first&.last || -1
end