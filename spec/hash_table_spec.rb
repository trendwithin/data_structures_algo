require './lib/hash_table'
require 'minitest/autorun'
require 'set'

class TestHashTable < MiniTest::Test

  def setup
    @ht = HashTable.new(260)
    @word = "ant"
    @words = %w{ ant chocolate xylaphone you zebra banana pear cat}
    @wordlist ||= Set.new(open('/usr/share/dict/words').readlines.map(&:strip))
  end

  def test_size_of_table
    expected = 260;
    assert_equal expected, @ht.bucketcheck
  end

  def test_value_of_word
    expected = 323
    assert_equal expected, @ht.sum_of_word(@word)
  end

  def test_which_bucket
    expected = 63
    @ht.sum_of_word(@word)
    assert_equal expected, @ht.which_bucket
  end

  def test_reverse_word
    expected = "tna"
    assert_equal expected, @ht.reverse_word(@word)
  end

  def test_hash_hardhat_zone
    expected = 260
    # arr = @ht.hash_hardhat_zone(@word)
    arr = @ht.hash_hardhat_zone()
    assert_instance_of HashTable::Node, arr[0]
    # assert_equal word, arr[0].word
    # assert_equal nil, arr[0].next
    assert_equal expected, arr.size
  end

  def test_add_feature
    expected = 63
    @ht.sum_of_word(@word)
    assert_equal expected, @ht.which_bucket
    arr = @ht.hash_hardhat_zone()
    @ht.set(@word)
    assert_equal "ant", arr[63].word
  end

  def test_looped_additions
    arr = @ht.hash_hardhat_zone()
    @words.each { |w| @ht.set(w) }
    # arr.each { |w| puts w }
  end

  def test_get_word
    expected = "ant"
    arr = @ht.hash_hardhat_zone()
    @ht.set(@word)
    assert_equal expected, arr[63].word
    assert_equal expected, @ht.get(@word)
  end

  def test_get_word_from_many
    expected = "you"
    expected2 = "zebra"
    arr = @ht.hash_hardhat_zone
    @words.each { |w| @ht.set(w) }
    assert_equal expected, @ht.get("you")
    assert_equal expected2, @ht.get("zebra")
  end

  def test_reversed_word
    expected = "tna"
    arr = @ht.hash_hardhat_zone
    @ht.set(@word)
    assert_equal expected, @ht.get_reversed(@word)
  end

  def test_reversed_words
    expected = "uoy"
    arr = @ht.hash_hardhat_zone
    @words.each { |w| @ht.set(w) }
    assert_equal expected, @ht.get_reversed("you")
  end

  def test_non_string
    expected = "Invalid Input, Strings Only"
    arr = @ht.hash_hardhat_zone
    @words.each { |w| @ht.set(w) }
    assert_equal expected, @ht.get(1)
  end

  def test_with_dictionary
    expected = "cat"
    arr = @ht.hash_hardhat_zone
    @wordlist.each { |w| @ht.set(w) }
    assert_equal expected, @ht.get(expected)
  end
end
