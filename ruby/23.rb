# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  lists.compact!
  lists.sort_by!(&:val)
  head = lists.first
  previous = nil
  
  while min = lists.shift
    previous.next = min if previous
    previous = min
    insert_next(lists, min)
  end
  
  head
end

private def insert_next(lists, node)
  return if node.next.nil?
  
  index = lists.bsearch_index { |i| i.val > node.next.val } || -1
  lists.insert(index, node.next)
end