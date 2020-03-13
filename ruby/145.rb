# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  result = []
  stack = [root]
  
  until stack.empty?
    root = stack.pop
    next if root.nil?
    
    stack << root.left
    stack << root.right
    result.unshift(root.val)
  end
  
  result
end