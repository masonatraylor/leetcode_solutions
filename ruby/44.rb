# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  s_idx = p_idx = s_start_idx = 0
  star_idx = -1
  
  while s_idx < s.size
    if s[s_idx] == p[p_idx] || p[p_idx]  == '?'
      s_idx += 1
      p_idx += 1
    elsif p[p_idx] == '*'
      star_idx = p_idx
      s_start_idx = s_idx
      p_idx = star_idx + 1
    elsif star_idx >= 0
      p_idx = star_idx + 1
      s_start_idx += 1
      s_idx = s_start_idx
    else
      return false
    end
  end
  
  p_idx += 1 while p[p_idx] == '*'
    
  p_idx == p.size
end
