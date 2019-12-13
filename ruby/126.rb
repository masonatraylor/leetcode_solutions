# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {String[][]}
def find_ladders(begin_word, end_word, word_list)
  hash = create_hash(word_list)
  bfs(begin_word, end_word, hash)
end

private def create_hash(words)
  hash = Hash.new { |h, k| h[k] = [] }
  words.each do |word|
    keys_from(word).each { |key| hash[key] << word }
  end
  hash
end

private def keys_from(word)
  result = []
  word.size.times do |i|
    key = word.clone
    key[i] = '_'
    result << key
  end
  result
end

private def bfs(begin_word, end_word, hash)
  queue = [[begin_word]]
  seen = Set[]
  result = []
  
  while result.empty? && !queue.empty?
    seen += queue.map(&:last)
    
    queue.size.times do
      path = queue.shift
      word = path.last
      keys = keys_from(word)
      values = keys.map { |key| hash[key] }.flatten

      values.each do |value|
        next if seen.include?(value)
        
        new_path = path.clone << value
        result << new_path if value == end_word
        queue << new_path
      end
    end
    
  end
    
  result
end
