class MedianFinder

  =begin
    initialize your data structure here.
  =end
    def initialize()
      @list = []
    end
  
  
  =begin
    :type num: Integer
    :rtype: Void
  =end
    def add_num(num)
      index = @list.bsearch_index { |n| n <= num } || @list.size
      @list.insert(index, num)
    end
  
  
  =begin
    :rtype: Float
  =end
    def find_median()
      return nil if @list.empty?
  
      if @list.size.odd?
        @list[@list.size / 2].to_f
      else
        (@list[@list.size / 2] + @list[@list.size / 2 - 1]) / 2.0
      end
    end
  end
  