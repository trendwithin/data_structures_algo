require './lib//stack_array'
require 'minitest/autorun'
require 'test/unit/assertions'

class TestStackArray < Minitest::Test
  include Test::Unit::Assertions

  def setup
    @sa = StackArray.new
  end

  def test_push_empty_array
    @sa.elements(1)
    @sa.push('A')
    assert_equal 'A', @sa.stack_array[@sa.top]
  end

  def test_push_two_elements
    @sa.elements(2)
    @sa.push('A')
    assert_equal 'A', @sa.stack_array[@sa.top]
    @sa.push('B')
    assert_equal 'B', @sa.stack_array[@sa.top]
  end

  def test_elements_push_when_stack_full_returns_error
    @sa.elements(1)
    @sa.push('A')
    assert_raise(RuntimeError) { @sa.push('B') }
  end

  def test_pop_empty_array_retruns_error
    @sa.elements(1)
    assert_raise(RuntimeError) { @sa.pop }
  end

  def test_pop_on_one_element
    @sa.elements(2)
    @sa.push('A')
    @sa.pop
    assert_equal -1, @sa.top
    assert_raise(RuntimeError) { @sa.pop }
  end

  def test_pop_on_multi_elements
    @sa.elements(3)
    @sa.push('C')
    @sa.push('B')
    @sa.push('A')
    assert_equal 'A', @sa.stack_array[@sa.top]
    @sa.pop
    assert_equal 'B', @sa.stack_array[@sa.top]
    @sa.pop
    assert_equal 'C', @sa.stack_array[@sa.top]
  end
end
