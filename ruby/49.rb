# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.group_by { |str| count_map(str) }.values
end

def count_map(str)
  map = Hash.new(0)
  str.each_char { |c| map[c] += 1 }
  map
end