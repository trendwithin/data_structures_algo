require './lib/linked_list_nth_element'
# require './lib/linked_list'
require 'minitest/autorun'

class TestLinkedListNthElement < MiniTest::Test
  def setup
    @ll = LinkedListNthElement.new
    @ll.add('A')
    @ll.add('B')
    @ll.add('C')
    @ll.add('D')
    @ll.add('E')
  end


  def test_an_empty_list
    @one = LinkedListNthElement.new
    assert_equal nil, @one.search(1)
  end

  def test_one_element_while_nth_equals_one
    @one = LinkedListNthElement.new
    @one.add('A')
    assert_equal 'A', @one.search(1)
  end

  def test_two_elements_while_nth_equals_one
    @two = LinkedListNthElement.new
    @two.add('A')
    @two.add('B')
    puts @two
    assert_equal ('A'), @two.search(1)
  end

  def test_two_elements_while_nth_equals_two
    @two = LinkedListNthElement.new
    @two.add('A')
    @two.add('B')
    assert_equal 'B', @two.search(2)
  end

  def test_three_elements_while_nth_equals_two
    @three = LinkedListNthElement.new
    @three.add('A')
    @three.add('B')
    @three.add('C')
    assert_equal 'B', @three.search(2)
  end

  def test_5_elements_while_nth_equals_two
    assert_equal 'C', @ll.search(3)
  end

  def test_5_elements_with_nth_equals_6
    assert_equal nil, @ll.search(6)
  end
end
