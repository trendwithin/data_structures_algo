class HashTable

  def initialize(size)
    @table_size = size
    @head = nil
    @next = nil
  end

  def hash_hardhat_zone
    @hash_table = Array.new(@table_size)
    @hash_table.map! do
      Node.new(@head, @next)
    end
  end

  def set(word)
    reversed = reverse_word(word)
    node = Node.new(word, reversed, nil)
    sum_of_word(word)

    if @hash_table[which_bucket].word.nil?
      @head = node
      @hash_table[which_bucket] = @head
    else
      @head = @hash_table[which_bucket]
      node.next = @head
      @head = node
      @hash_table[which_bucket] = @head
    end
  end

  def get(word)
    return "Invalid Input, Strings Only" unless word.instance_of? String
    sum_of_word(word)
    node = @hash_table[which_bucket]
    until node.nil?
      return word if node.word == word
      node = node.next
    end
  end

  def get_reversed(word)
    return "Invalid Input, Strings Only" unless word.instance_of? String
    sum_of_word(word)
    node = @hash_table[which_bucket]
    until node.nil?
      return node.reversed if node.word == word
      node = node.next
    end
  end

  def which_bucket
    @bucket = @ascii_sum.modulo(@table_size)
  end

  def sum_of_word(string)
    @ascii_sum = string.sum
  end

  def bucketcheck
    @table_size
  end

  def reverse_word(string)
    string.reverse
  end

  Node = Struct.new(:word, :reversed, :next)
end
