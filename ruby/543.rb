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
def diameter_of_binary_tree(root)
  height_and_diameter(root).last
end

private def height_and_diameter(root)
  return [0, 0] if root.nil?
  
  left = height_and_diameter(root.left)
  right = height_and_diameter(root.right)
  
  height = [left.first, right.first].max + 1
  diameter = [left.last, right.last, left.first + right.first].max
  
  [height, diameter]
end