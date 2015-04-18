require './lib/binary_search_tree'
require 'minitest/autorun'

class TestBinarySearchTree < Minitest::Test
  def setup
    @bst = BinarySearchTree.new
    @primero_node = @bst.create_node(15)
    @segundo_node = @bst.create_node(11)
  end

  def test_for_orphan
    expected = "Fruitless Search"
    assert_equal expected, @bst.search(1)
  end

  def test_values_of_first_node
    @bst.insert(@primero_node)
    assert_equal nil, @primero_node.l_child
    assert_equal nil, @primero_node.r_child
    assert_equal 15, @primero_node.value
  end
  def test_for_second_insertion
    expected = nil
    @bst.insert(@primero_node)
    @bst.insert(@segundo_node)
    assert_equal expected, @segundo_node.l_child
    assert_equal expected, @segundo_node.r_child
    assert_equal 11, @segundo_node.value
  end

  def test_first_nodes_child
    skip
    # puts @primero_node
    # puts @segundo_node
    assert_equal @segundo_node, @primero_node.l_child
  end
end
