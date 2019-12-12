# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  @max = -1.0/0
  max_path_sum_recurse(root)
  @max
end

# Returns [x, y] where x is maximum path,
#  and y is maximum path that can be routed from the parent
def max_path_sum_recurse(root)
  return 0 if root.nil?

  left = [0, max_path_sum_recurse(root.left)].max
  right = [0, max_path_sum_recurse(root.right)].max

  @max = [@max, root.val + left + right].max

  root.val + [left, right].max
end