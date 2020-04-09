# @param {String[]} words
# @return {String}
def longest_word(words)
  max = ''
  @all_words = words.to_set
  @valid_words = Set['']
  
  words.each do |word|
    max = word if (word.size > max.size ||
                  (word.size == max.size && word < max)) &&
                  (valid?(word))
  end
  
  max
end

private def valid?(word)
  return true if @valid_words.include?(word)
  return false unless @all_words.include?(word)
  
  @valid_words.add(word) if valid?(word[0..-2])
end