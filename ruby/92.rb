# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  start = head
  (m - 2).times { start = start.next }
  
  previous_node = (m == 1) ? start : start.next
  current_node = previous_node.next
  
  (n - m).times do
    next_node = current_node.next
    current_node.next = previous_node
    previous_node = current_node
    current_node = next_node
  end
  
  if m == 1
    start.next = current_node
    previous_node
  else
    start.next&.next = current_node
    start.next = previous_node
    head
  end
end