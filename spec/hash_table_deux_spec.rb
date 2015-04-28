require './lib/hash_table_deux'
require 'minitest/autorun'
require 'set'

class TestHashTableDeux < MiniTest::Test

  def setup
    @ht = HashTableDeux.new(2600)
    @word = "ant"
    @words = %w{ ant chocolate xylaphone you zebra banana pear cat}
    @wordlist ||= Set.new(open('/usr/share/dict/words').readlines.map(&:strip))
  end

  def test_size_of_table
    expected = 2600;
    assert_equal expected, @ht.bucketcheck
  end

  def test_single_word
    arr = @ht.hash_table
    @ht.set(@word, @word.reverse)
    assert_equal "ant", arr[323].word
  end

  def test_multi_words
    arr = @ht.hash_table
    @words.each { |w| @ht.set(w, w.reverse) }
  end

  def test_get_ant_reversed
    arr = @ht.hash_table
    @words.each { |w| @ht.set(w, w.reverse)}
    assert_equal @ht.get("ant"), "tna"
  end

  def test_get_cat_reversed
    arr = @ht.hash_table
    @words.each { |w| @ht.set(w, w.reverse)}
    assert_equal @ht.get("cat"), "tac"
  end

  def test_with_dictionary
    expected = "tac"
    arr = @ht.hash_table
    @wordlist.each { |w| @ht.set(w, w.reverse) }
    assert_equal expected, @ht.get("cat")
  end

  def test_deleting_a_word
    arr = @ht.hash_table
    @ht.set(@word, @word.reverse)
    @ht.delete(@word)
  end
end
