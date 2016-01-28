class StackArray
  attr_reader :top, :stack_array
  def initialize
    @top = -1
  end

  def push value
    fail 'Full' if full?
    if empty?
      @top = 0
    else
      @top += 1
    end
    @stack_array[@top] = value
  end

  def pop
    fail 'Empty' if empty?

    @top -= 1
  end


  def elements value
    @stack_array = Array.new(value)
  end

  private

  def empty?
    @top == -1
  end

  def full?
    @top + 1 == @stack_array.size
  end
end
