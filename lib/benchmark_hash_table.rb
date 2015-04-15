require 'benchmark'
include Benchmark
require_relative 'hash_table'
require 'set'

@hash = HashTable.new(2600);
@hash.hash_hardhat_zone
@rand = HashTable.new(2600);
@rand.hash_hardhat_zone

@wordlist ||= Set.new(open('/usr/share/dict/words').readlines.map(&:strip))
@dictionary = Array.new(open('/usr/share/dict/words').readlines.map(&:strip))

@wordlist.each { |w| @hash.set(w)}
@random = @dictionary.shuffle
@random.each { |w| @rand.set(w) }
n = 1

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Storing: \n") do
    n.times do
      ht = HashTable.new(2600)
      ht.hash_hardhat_zone
      @wordlist.each { |w| ht.set(w) }
    end
  end
  [total, total / n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Retrieval \n") do
    n.times do
      @hash.get("cat")
      @hash.get_reversed("you")
    end
  end
  [total, total / n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Retrieve All Words \n") do
    n.times do
      @wordlist.each { |w| @hash.get(w) }
    end
  end
  [total, total / n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Retrieve All Words Reversed \n") do
    n.times do
      @dictionary.reverse!
      @dictionary.each { |w| @hash.get(w) }
    end
  end
  [total, total / n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Retrieval Random Word \n") do
    n.times do
      @rand.get("cat")
      @hash.get_reversed("you")
    end
  end
  [total, total / n]
end
