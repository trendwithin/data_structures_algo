require './lib/bstree'
require 'minitest/autorun'
require 'byebug'

class TestBSTree < MiniTest::Test
  def setup
    @bst = BSTree.new
  end

  def test_insertion_in_empty_tree
    @bst.insert(1)
    assert_equal 1, @bst.root.data
  end

  def test_two_nodes_one_less_than_root
    @bst.insert(10)
    @bst.insert(5)
    assert_equal 10, @bst.root.data
    assert_equal 5,  @bst.root.left.data
  end

  def test_three_nodes_each_side_of_root
    [10, 5, 15].each { |data| @bst.insert(data) }
    assert_equal 10, @bst.root.data
    assert_equal 5, @bst.root.left.data
    assert_equal 15, @bst.root.right.data
  end

  def test_in_order_traversal_stored_values_in_array
    [15, 10, 6, 8, 7, 5].each { |data| @bst.insert(data) }
    assert_equal [5, 6, 7, 8, 10, 15], @bst.inorder
  end

  def test_find_max_height_of_tree
    [15, 10, 6, 8, 7, 5].each { |data| @bst.insert(data) }
    assert_equal 5, @bst.find_height
  end

  def test_if_bst_is_invalid
    @bst.root = TreeNode.new(15)
    @bst.root.left = TreeNode.new(10)
    @bst.root.left.left = TreeNode.new(20)
    assert_equal false, @bst.valid_bst?
  end

  def test_if_bst_is_valid
    [20, 15, 10].each { |data| @bst.insert(data) }
    assert_equal true, @bst.valid_bst?
  end

  def test_if_bst_valid
    [15, 10, 20, 8, 7, 25].each { |data| @bst.insert(data) }
    assert_equal true, @bst.valid_bst?
  end

  def test_invalid_bst
    @bst.root = TreeNode.new(15)
    @bst.root.right = TreeNode.new(5)
    @bst.root.left = TreeNode.new(10)
    @bst.root.left.right = TreeNode.new(12)
    assert_equal false, @bst.valid_bst?
  end

  def test_invalid_bst
    @bst.root = TreeNode.new(15)
    @bst.root.right = TreeNode.new(5)
    @bst.root.left = TreeNode.new(10)
    @bst.root.left.right = TreeNode.new(12)
    assert_equal false, @bst.valid?
  end


  def test_invalid_bst
    @bst.root = TreeNode.new(15)
    @bst.root.right = TreeNode.new(5)
    @bst.root.left = TreeNode.new(10)
    assert_equal false, @bst.vbst?
  end

  def test_nth_returns_correct_data
    [15, 10, 20, 8, 7, 25].each { |data| @bst.insert(data) }
    @bst.nth_element(2)
    assert_equal 8, @bst.nth.data
  end

  def test_nth_returns_data
    [15, 10, 20, 8, 7, 25].each { |data| @bst.insert(data) }
    @bst.nth_element(3)
    assert_equal 10, @bst.nth.data
  end
end
