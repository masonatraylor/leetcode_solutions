# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  (s + s)[1...-1].include? s
end
