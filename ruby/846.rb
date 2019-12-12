# @param {Integer[]} hand
# @param {Integer} w
# @return {Boolean}
def is_n_straight_hand(hand, w)
  return false if hand.size % w != 0
  
  counts = count_map hand
  
  until counts.empty?
      start = counts.first.first
      start -= 1 while counts.has_key?(start)
          
      while (start_count = counts[start + 1])
          (start+1..start+w).each do |num|
              return false unless (num_count = counts[num]) && (num_count >= start_count)
            
              if num_count == start_count
                  start += 1
                  counts.delete(num)
              else
                  counts[num] = num_count - start_count
              end
          end
      end
  end
  true
end

private def count_map numbers
  numbers.group_by(&:to_i).transform_values(&:size)
end