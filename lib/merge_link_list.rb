# Merge Two Sorted LL into One Sorted LL

class Node
  attr_reader :val
  attr_accessor :next
  def initialize val
    @val = val
    @next = nil
  end
end

list_1 = Node.new(5)
list_1.next = Node.new(6)

list_2 = Node.new(4)
list_2.next = Node.new(7)


def merge_two(l1, l2)

  head = Node.new('Empty')
  current = head

  while !l1.nil? && !l2.nil?
    if l1.val <= l2.val
      current.next = l1
      l1 = l1.next
      current = current.next
    else
      current.next = l2
      l2 = l2.next
      current = current.next
    end
    if l1.nil?
      current.next = l2
    elsif l2.nil?
      current.next = l1
    end
  end

  head = head.next
end

p merge_two(list_1, list_2)
