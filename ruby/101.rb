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
def is_symmetric(root)
  are_symmetric?(root&.left, root&.right)
end

private def are_symmetric?(t1, t2)
  (t1.nil? && t2.nil?) ||
    (t1&.val == t2&.val &&
      are_symmetric?(t1.left, t2.right) &&
      are_symmetric?(t2.left, t1.right))
end