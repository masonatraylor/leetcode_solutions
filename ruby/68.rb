# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  lines = []
  extra_spaces = []
  
  i = 0
  while i < words.size
    line = [words[i]]
    size = words[i].size
    
    i += 1
    while i < words.size && size + words[i].size + 1 <= max_width
      size += words[i].size + 1
      line << words[i]
      i += 1
    end
    
    lines << line
    extra_spaces << max_width - size
  end
  
  extra_spaces[-1] = 0
  
  result = []
  lines.each_with_index do |line, line_idx|
    current = line.shift
    line.each_with_index do |word, word_idx|
      spaces = 1 + extra_spaces[line_idx] / line.size
      spaces += 1 if extra_spaces[line_idx] % line.size > word_idx
      current << ' ' * spaces + word
    end
    
    current << ' ' * (max_width - current.size)
    result << current
  end
    
  result
end