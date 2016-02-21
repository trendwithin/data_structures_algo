class TreeNode
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class BSTree
  attr_accessor :root, :data, :prev, :nth
  def initialize
    @root = TreeNode.new(nil)
    @sorted = Array.new
    @prev = nil
    @count = 0
    @nth = nil
  end

  def insert(data, node = @root)
    if node.data.nil?
      return node.data = data
    end

    until node.nil?
      if data < node.data && node.left.nil?
        return node.left = TreeNode.new(data)
      elsif data >= node.data && node.right.nil?
        return node.right = TreeNode.new(data)
      elsif data < node.data
        node = node.left
      elsif data >= node.data
        node = node.right
      else
        return
      end
    end
  end

  def inorder node = @root
    return if node.nil?
    inorder(node.left)
    @sorted << node.data
    inorder(node.right)
    @sorted
  end

  def find_height node = @root
    return 0 if node.nil?
    [find_height(node.left) + 1, find_height(node.right) + 1 ].max
  end

  def valid_bst?(node = @root)
    if node
      return false if !valid_bst?(node.left)
      return false if !@prev.nil? && node.data <= @prev.data
      @prev = node
      return valid_bst?(node.right)
    end
    true
  end

  def valid?()
    validity = valid_bst?()
    @prev = nil
    p @prev
    validity
  end

  def vbst?(node = @root, prev = nil)
    if node
      return false if !vbst?(node.left, node)
      return false if !prev.nil? && node.data <= prev.data
      prev = node
      return vbst?(node.right, node)
    end
    true
  end

  def nth_element(nth, node = @root)
    return if node.nil?
    nth_element(nth, node.left)
    @count += 1
    if @count == nth
      grab_nth(node)
    end
    nth_element(nth, node.right)
  end

  def grab_nth(node = @root)
    @nth = node
  end
end
