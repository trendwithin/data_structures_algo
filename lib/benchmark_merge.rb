require 'benchmark'
include Benchmark
require_relative 'merge_sort'

array  = (1..1_000_000).map { rand }
array2 = (1..1_000_000).to_a.shuffle
array3 = (1..1_000_000).to_a
n = 1

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg:") do |x|
  total = x.report do
    n.times do
      l1 = MergeSort.new
      l1.merge_sort(array)
    end
  end
  [total, total/n]
end


Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg:") do |x|
  total = x.report do
    n.times do
      l1 = MergeSort.new
      l1.merge_sort(array2)
    end
  end
  [total, total/n]
end

Benchmark.benchmark(CAPTION, 4, FORMAT, "total: " "avg:") do |x|
  total = x.report do
    n.times do
      l1 = MergeSort.new
      l1.merge_sort(array3)
    end
  end
  [total, total/n]
end
