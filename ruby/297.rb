# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  return 'nil' if root.nil?
  
  [root.val, serialize(root.left), serialize(root.right)].join(',')
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  val = data.slice!(0..(data.index(',') || -1)).chomp(',')
  return nil if val == 'nil'
  
  node = TreeNode.new(val)
  node.left = deserialize(data)
  node.right = deserialize(data)
  
  node
end
