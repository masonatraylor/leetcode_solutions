# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  max = nil
  hash = Hash.new(0)
  t.each_char do |c|
    hash[c] += 1
  end
  
  head = tail = 0
  total_needed = t.size
  until tail == s.size
    c = s[tail]
    tail += 1
    next unless hash.key?(c)

    hash[c] -= 1
    total_needed -= 1 unless hash[c] < 0
    next unless total_needed.zero?

    while total_needed.zero?
      c = s[head]
      head += 1
      next unless hash.key?(c)

      total_needed += 1 unless hash[c] < 0
      hash[c] += 1
    end

    max = s[head-1...tail] if max.nil? || tail - head < max.size
  end

  max || ''
end