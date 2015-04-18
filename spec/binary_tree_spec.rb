require './lib/binary_tree'
require 'minitest/autorun'

class TestBinaryTree < Minitest::Test
  def setup
    @tree = BinaryTree.new()

    @tree.add("Tim", "Jony", "Phil")
    @tree.add("Phil", "Craig", "Eddie")
    @tree.add("Jony", "Dan", "Katie")
    @tree.add("Katie", "Peter", "Andrea")
  end

  def test_added_values
    first = @tree.root
    assert_equal "Tim", first.value
    assert_equal "Jony", first.array[0]
    assert_equal "Phil", first.array[1]
    assert_equal "Phil", first.left.value
    assert_equal "Jony", first.right.value
  end

  def test_pre_order
    @oak = @tree.preorder(@tree.seedling)
    @tree.val
  end

  def test_inorder
    @tree.inorder(@tree.seedling)
  end

  def test_postorder
  @tree.postorder(@tree.seedling)
  end
end
