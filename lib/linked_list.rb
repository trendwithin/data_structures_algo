class LinkedList

  def initialize
    @head = nil
    @next = nil
  end

  def add(val)
    node = Node.new(val, nil)
    if @head.nil?
      @head = node
    else
      node.next = @head
      @head = node
    end
    @head.val
  end

  def search(val)
    node = @head

    while node != nil
      return node.val if node.val == val
      node = node.next
    end
    nil
  end

  def remove(val)
    return nil if @head.nil?
    node = @head
    del_node = nil

    if node.val == val
      del_node = @head
      @head = @head.next
    else
      node = @head
      while node != nil
        if node.next.val == val
          del_node = node.next
          node.next = node.next.next
        end
      end
    end
    del_node
  end

  def to_s
    node = @head
    str = ""

    while node != nil
      str << (node.val.to_s + ", ")
      node = node.next
    end
    str
  end

  Node = Struct.new(:val, :next)
end
