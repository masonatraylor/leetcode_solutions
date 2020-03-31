# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  return s.nil? && t.nil? if s.nil? || t.nil?
  
  is_equal(s, t) || is_subtree(s.left, t) || is_subtree(s.right, t)
end
  
private def is_equal(s, t)
  (s.nil? && t.nil?) ||
    (s&.val == t&.val &&
      is_equal(s&.left, t&.left) &&
      is_equal(s&.right, t&.right))
end