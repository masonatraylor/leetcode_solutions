# @param {String} s
# @return {String}
def longest_palindrome(s)
  longest = ''
  offset = 0
  middle = s.size/2
  
  until longest.size / 2 > middle - offset
    [-1, 1].each do |sign|
      pivot = middle + sign * offset

      [0, 1].each do |start_length|
        palindrome = palindrome_from_pivot(s, pivot, pivot + start_length)
        longest = [longest, palindrome].max_by(&:size)
      end
    end
    
    offset += 1
  end
  
  longest
end

private def palindrome_from_pivot(s, start, stop)
  while start >= 0 && stop < s.size && s[start] == s[stop]
    start -= 1
    stop += 1
  end
  
  s[start + 1..stop - 1] || ''
end