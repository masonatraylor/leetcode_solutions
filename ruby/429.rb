# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[List[int]]}
def levelOrder(root)
  result = []
  queue = [root].compact
  
  until queue.empty?
    result << queue.map(&:val)
    queue = queue.flat_map(&:children)
  end
  
  result
end
