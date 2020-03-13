# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder, seen = Set[nil])
  return nil if seen.include?(inorder.first)
  
  val = preorder.shift
  seen << val
  
  node = TreeNode.new(val)
  node.left = build_tree(preorder, inorder, seen)
  inorder.shift
  node.right = build_tree(preorder, inorder, seen)
  
  node
end