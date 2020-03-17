# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  starts = intervals.map(&:first).sort
  ends = intervals.map(&:last).sort
  
  rooms = 0
  starts.each_with_index do |start, i|
    rooms += 1 if start < ends[i - rooms]
  end
  
  rooms
end