# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  prev = nil
  
  until head.nil?
    nxt = head.next
    head.next = prev
    prev = head
    head = nxt
  end
  
  prev
end