require './lib/linked_list'

class LinkedListNthElement < LinkedList
  def initialize
    @count = 0
  end
  def search(nth_from_end)

    node = @head
    pnode = @head

    if node.nil?
      return nil
    elsif node.next.nil?
      return node.val
    end

    until node.nil?
      @count += 1
      if @count > nth_from_end
        pnode = pnode.next unless pnode.next.nil?
      end
      node = node.next
    end
    return nil if @count < nth_from_end
    pnode.val
  end
end
