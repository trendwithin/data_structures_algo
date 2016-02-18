require './lib/delete_bst_node'
require 'minitest/autorun'
require 'byebug'

class TestBST < MiniTest::Test
  def setup
    @bst = BST.new(10)
    @bst.insert(5)
    @bst.insert(15)
    @bst.insert(3)
    @bst.insert(7)
    @bst.insert(1)
    @bst.insert(9)
    @bst.insert(13)
    @bst.insert(17)
    @bst.insert(19)
  end

  def test_empty_tree
    empty_tree = BST.new(nil)
    assert_equal nil, empty_tree.delete(15)
  end

  def test_node_root_node_with_0_children
    one_leaf = BST.new(10)
    assert_equal nil, one_leaf.delete(10)
    assert_equal nil, one_leaf.root
  end

  def test_delete_left_child_of_root
   lc = BST.new(10)
   lc.insert(5)
    lc.delete(5)
    assert_equal nil, lc.root.left
    assert_equal nil, lc.root.right
    assert_equal 10, lc.root.val
  end

  def test_delete_right_child_of_root
    rc = BST.new(10)
    rc.insert(15)
    rc.delete(15)
    assert_equal nil, rc.root.right
    assert_equal 10, rc.root.val
  end

  def test_delete_root
    @bst.delete(10)
    assert_equal 9, @bst.root.val
  end

  def test_delete_recursive
    @bst.delete_recursive(10)
  end
end
