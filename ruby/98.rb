# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root, min = -1.0 / 0, max = 1.0 / 0)
  return min < max if root.nil? 
  
  is_valid_bst(root.left, min, root.val) && is_valid_bst(root.right, root.val, max)
end