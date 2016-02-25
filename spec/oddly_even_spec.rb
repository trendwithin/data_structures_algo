require 'minitest/autorun'
require './lib/oddly_even'
require 'byebug'


class TestOddlyEven < Minitest::Test
  def setup
    @ll = Node.new('A')
    @ll.next = Node.new('B')
    @ll.next.next = Node.new('C')
    @ll.next.next.next = Node.new('D')
  end

  def test_list_with_1_item
    ll= Node.new('A')
    new_lists = OddlyEven.seperate_odds_from_evens(ll)
    odds = new_lists[0]
    evens = new_lists[1]
    assert_equal 'A', odds.val
    assert_equal nil, evens
  end

  def test_separate_linked_list_into_odd_even_positions
    new_lists = OddlyEven.seperate_odds_from_evens(@ll)
    odds = new_lists[0]
    evens = new_lists[1]

    assert_equal 'A', odds.val
    assert_equal 'C', odds.next.val
    assert_equal 'B', evens.val
    assert_equal 'D', evens.next.val
  end
end
