# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  max = 0
  stack = [-1]

  s.chars.each_with_index do |c, i|
    if c == '('
      stack << i
    else
      if stack.size > 1
        stack.pop
        max = [max, i - stack.last].max
      else
        stack[0] = i
      end
    end
  end

  max
end