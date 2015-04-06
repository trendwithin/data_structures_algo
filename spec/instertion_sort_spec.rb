require 'insertion_sort'
require 'minitest/autorun'

class TestInsertionSort < MiniTest::Test
  def setup
    @is = InsertionSort.new
  end

  def test_base_case
    expected = [1]
    arr = [1]
    assert_equal expected, @is.sorted(arr)
  end

  def test_two_values
    expected = [1,2]
    arr = [2,1]
    assert_equal expected, @is.sorted(arr)
  end

  def test_numbers_from_songs
    expected = [1, 12, 13, 16, 17, 99]
    arr = [99, 1, 12, 16, 17, 13]
    assert_equal expected, @is.sorted(arr)
  end
end
