require './lib//queue_array'
require 'minitest/autorun'
require 'test/unit/assertions'

class TestQueueArray < Minitest::Test
  include Test::Unit::Assertions
  def setup
    @qa = QueueArray.new
  end

  def test_empty_array_returns_nil_when_dequeued
    @qa.size_the_queue(1)
    assert_equal -1, @qa.front
    assert_equal -1, @qa.rear
    assert_equal nil, @qa.dequeue
  end

  def test_array_of_one_returns_head_equals_tail
    @qa.size_the_queue(1)
    @qa.enqueue('A')
    assert_equal @qa.front, @qa.rear
  end

  def test_array_of_size_one_with_two_values
    @qa.size_the_queue(1)
    @qa.enqueue('A')
    assert_raise(RuntimeError) { @qa.enqueue('B') }
  end

  def test_array_of_size_two_with_deletion_followed_by_addition
    @qa.size_the_queue(2)
    @qa.enqueue('A')
    @qa.enqueue('B')
    @qa.dequeue
    @qa.enqueue('C')
    assert_equal @qa.queue_array[@qa.front], 'B'
    assert_equal @qa.queue_array[@qa.rear], 'C'
  end

  def test_array_of_size_two_with_multiple_enqueue_dequeu
    @qa.size_the_queue(2)
    @qa.enqueue('A')
    @qa.enqueue('B')
    @qa.dequeue
    @qa.enqueue('C')
    @qa.dequeue
    @qa.enqueue('D')
    assert_equal @qa.queue_array[@qa.front], 'C'
    assert_equal @qa.queue_array[@qa.rear], 'D'
  end
end
