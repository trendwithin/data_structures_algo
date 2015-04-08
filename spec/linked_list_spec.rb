require './lib/linked_list'
require 'minitest/autorun'

class TestLinkedList < Minitest::Test
  def setup
    @ll = LinkedList.new
  end

  def test_add_node
    expected = 3
    assert_equal expected, @ll.add(3)
  end

  def test_search_one_value
    @ll.add(3)
    expected = 3
    assert_equal expected, @ll.search(3)
  end

  def test_search_of_three_values
    @ll.add(4)
    @ll.add(6)
    @ll.add(8)

    assert_equal 6, @ll.search(6)
  end

  def test_remove_empty_value
    expected = nil
    assert_equal expected, @ll.remove(3)
  end

  def test_remove_one_item
    @ll.add(3)
    assert_instance_of LinkedList::Node, @ll.remove(3)
  end

  def test_to_s
    expected = "3, 2, 1, "
    @ll.add("1")
    @ll.add("2")
    @ll.add("3")

    assert_equal expected, @ll.to_s
  end

end
