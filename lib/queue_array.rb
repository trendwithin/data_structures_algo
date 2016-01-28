class QueueArray
  attr_reader :front, :rear, :queue_array

  def initialize
    @front = @rear = -1
  end

  def enqueue value
    fail 'Full' if full?

    if empty?
      @front = @rear = 0
    else
      @rear = (@rear + 1) % @queue_array.size
    end
    @queue_array[@rear] = value
  end


  def dequeue
    return nil if empty?
    if @front == @rear
      @front = @rear = -1
    else
      @front = (@front + 1) % @queue_array.size
    end
  end

  def size_the_queue num
    @queue_array = Array.new(num)
  end

  private

  def empty?
    @rear == -1
  end

  def full?
    (@rear + 1) % @queue_array.size == @front
  end
end
