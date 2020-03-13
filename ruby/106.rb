# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder, seen = Set[nil])
  return nil if seen.include?(inorder.last)
  
  val = postorder.pop
  seen << val
  
  current = TreeNode.new(val)
  current.right = build_tree(inorder, postorder, seen)
  inorder.pop
  current.left = build_tree(inorder, postorder, seen)
  
  current
end