class MajorityChecker

  =begin
      :type arr: Integer[]
  =end
      def initialize(arr)
        @arr = arr
        
        @random = Random.new
        @map = Hash.new { |h, k| h[k] = [] }
        arr.each_with_index do |i, idx|
          @map[i] << idx
        end
      end
  
  
  =begin
      :type left: Integer
      :type right: Integer
      :type threshold: Integer
      :rtype: Integer
  =end
      def query(left, right, threshold)
        25.times do
          index = left + @random.rand(right - left + 1)
          value = @arr[index]
          
          left_idx = @map[value].bsearch_index { |i| i >= left } || @map[value].size - 1
          right_idx = @map[value].bsearch_index { |i| i >= right } || @map[value].size - 1
          right_idx -= 1 if @map[value][right_idx] > right
  
          return value if right_idx - left_idx >= threshold - 1
        end
        
        -1
      end
  
  
  end
  
  # Your MajorityChecker object will be instantiated and called as such:
  # obj = MajorityChecker.new(arr)
  # param_1 = obj.query(left, right, threshold)