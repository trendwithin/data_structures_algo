class TreeNode
  attr_accessor :val, :left, :right

  def initialize val, l, r
    @val = val
    @left = l
    @right = r
  end
end

class BST
  attr_accessor :root, :count
  def initialize val
    @root = TreeNode.new(val, nil, nil)
    @count = 1
  end

  def insert(val)
    current = @root

    until current.nil?
      if(val < current.val) && (current.left.nil?)
        current.left = TreeNode.new(val, nil, nil)
      elsif(val > current.val) && (current.right.nil?)
        current.right = TreeNode.new(val, nil, nil)
      elsif(val < current.val)
        current = current.left
      elsif(val > current.val)
        current = current.right
      else
        return
      end
    end
  end

  def inorder_traversal root = @root
    return if root.nil?
    inorder_traversal root.left
    puts root.val
    inorder_traversal root.right
  end

  def delete_recursive val, root = @root
    return nil if root.nil?

    if val < root.val
      root.left = delete_recursive val, root.left
    elsif val > root.val
      root.right = delete_recursive val, root.right
    else
      if root.left.nil? && root.right.nil?
        root = nil
      elsif root.left.nil?
        root = root.right
      elsif root.right.nil?
        root = root.left
      else
        temp = find_min root.right
        root.val = temp.val
        root.right = delete_recursive temp.val, root.right
      end
    end
    return root
  end

  def find_min root
    while root.left
      root = root.left
    end
    root
  end

  def delete key, node = @root
    # first part is like searching for a node
    return nil if node.val.nil?
    parent = nil
    left = false

    while !node.nil?
      if key == node.val
        break # if we find it we break
      end
      parent = node
      if key < node.val
        node = node.left
        left = true
      else
        node = node.right
        left = false
      end
    end

    # if not found then we are we have a nil
    if node.nil?
      return 'Value not found'
    end

    if !node.left.nil? && !node.right.nil?
      successor = node.left
      parent = node

      until successor.right.nil?
        parent = successor
        successor = successor.right
      end
      node.val = successor.val
      node = successor
    end

    # if found
    if node.left.nil? && node.right.nil? # leaf
      if parent.nil?
        @root = nil
        return nil
      end

      if left
        parent.left = nil
      else
        parent.right = nil
      end
      return root
    end

    if !node.left.nil? || !node.right.nil? # 1 child
      if parent.nil?
        return !node.left.nil? ? node.left : node.right
      end
      if node == parent.right
        parent.right = !node.left.nil? ? node.left : node.right
      else
        parent.left = !node.left.nil? ? node.left : node.right
      end
      return root
    end
  end
end
