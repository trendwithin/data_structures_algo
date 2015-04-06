require 'benchmark'
require_relative 'insertion_sort'

include Benchmark

array = (1..100000).map { rand }
array2 = (1..100000).to_a.shuffle
array3 = (1..100000).to_a
n = 1
Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg: ") do |x|
  total = x.report do
    n.times do
      l1 = InsertionSort.new
      l1.sorted(array)
    end
  end
  [total, total/n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg: ") do |x|
  total = x.report do
    n.times do
      l1 = InsertionSort.new
      l1.sorted(array2)
    end
  end
  [total, total/n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg: ") do |x|
  total = x.report do
    n.times do
      l1 = InsertionSort.new
      l1.sorted(array3)
    end
  end
  [total, total/n]
end
