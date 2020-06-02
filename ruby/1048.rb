# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
  word_map = {}
  
  words.sort_by(&:size).each do |word|
    word_map[word] = word
    previous = word[1..-1]
    
    word.size.times do |idx|
      word_map[word] = word_map[previous] if word_map.has_key?(previous)
      previous[idx] = word[idx]
    end
  end
  
  word_map.map { |key, val| key.size - val.size }.max + 1
end
