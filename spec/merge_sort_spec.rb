require 'merge_sort'
require 'minitest/autorun'

class TestMergeSort < Minitest::Test
  def setup
    @ms = MergeSort.new
  end

  def test_base_case
    expected = [1]
    arr = [1]
    assert_equal expected, @ms.merge_sort(arr)
  end

  def test_two_cases
    expected = [1, 2]
    arr = [2, 1]

    assert_equal expected, @ms.merge_sort(arr)
  end

  def test_three_cases
    expected = [1, 50, 100]
    arr = [50, 100, 1]
    assert_equal expected, @ms.merge_sort(arr)
  end

  def test_four_cases
    expected = [1, 12, 16, 17]
    arr = [16, 1, 12, 17]

    assert_equal expected, @ms.merge_sort(arr)
  end

  def test_five_cases
    expected = [1, 6, 12, 100, 150]
    arr = [6, 12, 1, 150, 100]

    assert_equal expected, @ms.merge_sort(arr)
  end

  def test_ten_cases
    expected = [1, 6, 10, 16, 17, 21, 25, 35, 88, 100]
    arr = [100, 17, 1, 6, 21, 88, 35, 10, 16, 25]

    assert_equal expected, @ms.merge_sort(arr)
  end

end
