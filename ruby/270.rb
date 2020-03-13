# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  return 1.0/0 if root.nil?
  
  child_branch = root.val > target ? root.left : root.right
  closest_child_val = closest_value(child_branch, target)
  [root.val, closest_child_val].min_by { |i| (i - target).abs }
end