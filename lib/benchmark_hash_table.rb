require 'benchmark'
include Benchmark
require_relative 'hash_table'
require 'set'

@wordlist ||= Set.new(open('/usr/share/dict/words').readlines.map(&:strip))
n = 1
n2 = 10
Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  total = x.report("Storing: \n") do
    n.times do
      ht = HashTable.new(100)
      ht.hash_hardhat_zone
      @wordlist.each { |w| ht.set(w) }
    end
  end
  [total, total / n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "\ntotal: " "\n avg:") do |x|
  ht = HashTable.new(100)
  ht.hash_hardhat_zone
  @wordlist.each { |w| ht.set(w) }
  total = x.report("Retrieval \n") do
    n2.times do
      ht.get("cat")
      ht.get_reversed("you")
    end
  end
  [total, total / n]
end
