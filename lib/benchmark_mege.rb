require 'benchmark'
include Benchmark
require_relative 'merge_sort'

array = (1..1000000).map { rand }
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


