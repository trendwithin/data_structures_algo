class BinaryTree
  attr_accessor :root
  def initialize
    @root = nil
    @arr = []
  end

  def add(value, *names)
    @arr = names
    node = Node.new(value, nil, nil, @arr)
    return @root = node if @root.nil?
    current = @root
    loop do
      if current.left.nil?
        current.left = node
        break
      elsif current.right.nil?
        current.right = node
        break
      elsif !current.left.nil? && !current.right.nil?
        current = current.left
      end
    end
  end

  def preorder(node)
    return "Nothing to Search" if @root.nil?
    if node.nil?
      return
    else
      node.value
      preorder(node.left)
      preorder(node.right)
    end
  end

  def inorder(node)
    return "Nothing to Search" if @root.nil?
    if node.nil?
      return
    else
      inorder(node.left)
      node.value
      inorder(node.right)
    end
  end

  def postorder(node)
    return "Nothing to Search" if @root.nil?
    if node.nil?
      return
    else
      postorder(node.left)
      postorder(node.right)
      node.value
    end
  end

  def search(value)
    @root.find(value)
  end

  def seedling
    @root
  end
  Node = Struct.new(:value, :left, :right, :array)
end
