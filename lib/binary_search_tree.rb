class BinarySearchTree

  def initialize
    @parent = nil
    @l_child = nil
    @r_child = nil
  end

  def create_node(val)
    @node = Node.new(nil, nil, val)
  end
  def search(val)
    return "Fruitless Search" if @parent.nil? && @l_child.nil? && @r_child.nil?

    #for testing return the first node
    @parent
  end

  def insert(node)
    if @parent.nil?
      @parent = @node
    elsif node.value <= @parent.value
      puts "##########################"
      puts @parent
      puts "##########################"
    end
  end


=begin
      until @parent.l_child.nil? insert(node)
        @parent.l_child = node
      end

    else
      return "Test Error"
    end
  end

    elsif val > @head.val
      until @r_child.nil? inser(val)
  end
=end
  Node = Struct.new(:l_child, :r_child, :value)
end
