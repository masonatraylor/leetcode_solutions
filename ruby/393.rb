# @param {Integer[]} data
# @return {Boolean}
def valid_utf8(data)
	idx = 0
	while idx < data.size
		check_bit = 7
		check_bit -= 1 while data[idx][check_bit] == 1

		return false if check_bit == 6 || check_bit < 3

		(6 - check_bit).times do
			idx += 1
			return false unless data[idx] && data[idx] >> 6 == 2
		end
    
    idx += 1
	end

	true    
end