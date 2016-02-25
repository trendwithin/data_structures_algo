class HashTableDeux
  def initialize(size)
    @table_size = size
    @head, @next = nil
  end

  def hash_table
    @hash_table = Array.new(@table_size)
    @hash_table.map! do
      Node.new(@head, @next)
    end
  end

  def set(word, reversed)
    node = Node.new(word, reversed, nil)
    bucket = hash(word)
    if @hash_table[bucket].word.nil?
      @head = node
      @hash_table[bucket] = @head
    else
      @head = @hash_table[bucket]
      node.next = @head
      @head = node
      @hash_table[bucket] = @head
    end
  end

  def get(word)
    fail "Invalid Input, Strings Only" unless word.instance_of? String
    node = @hash_table[hash(word)]
    until node.nil?
      return node.reversed if node.word == word
      node = node.next
    end
  end

  def delete(word)
    node = @hash_table[hash(word)]
    del_node = nil
    if @head.word == word
      @head = @head.next
    else
      until node.nil?
        if node.next.word == word
          node.next = node.next.next
          return word
        end
        node = node.next
      end
    end
    del_node
  end

  def hash(string)
    string.sum.modulo(@table_size)
  end

  def bucketcheck
    @table_size
  end

  Node = Struct.new(:word, :reversed, :next)
end
