# @param {String} s
# @return {Boolean}
def check_valid_string(s)
  min_open = max_open = 0
  
  s.each_char do |c|
    min_open += c == '(' ? 1 : -1
    max_open += c == ')' ? -1 : 1
    
    break if max_open.negative?
    min_open = 0 if min_open.negative?
  end
  
  min_open.zero?
end