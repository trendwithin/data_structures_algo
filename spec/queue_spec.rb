require './lib/queue'
require 'minitest/autorun'

class TestQueued < Minitest::Test
  def setup
    @q = Queued.new
  end

  def test_existence
    assert_instance_of Queued, @q
  end

  def test_it_enqueues
    expected = 50
    assert_equal expected, @q.enqueue(50)
  end

  def test_it_dequeues
    @q.enqueue(50)
    @q.enqueue(45)
    @q.enqueue(40)

    expected = 50
    assert_equal expected, @q.dequeue()
  end

  def test_empty_dequeues
    expected = "Can't dequeue an empty queue."
    ex = assert_raises Queued::EmptyQueueError do
      @q.dequeue
    end
    assert_equal expected, ex.to_s
  end
end
