class Queued

  class EmptyQueueError < ::RuntimeError
    def initialize(msg = "Can't dequeue an empty queue.")
      super
    end
  end

  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(value)
    node = Node.new(value, nil)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
    node.value
  end

  def dequeue
    node = @head
    @head = @head.next
    node.value
  rescue NoMethodError => e
    if e.to_s =~ /next/
      raise EmptyQueueError
    end
  end

  Node = Struct.new(:value, :next)
end















