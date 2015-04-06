class InsertionSort
  attr_accessor :val

  def initialize
    @val = []
  end

  def sorted(arr)
    arr.each_with_index do |e1, i|
      prev = i - 1
      while prev >= 0
        break if arr[prev] <= e1
        arr[prev + 1] = arr[prev]
        prev -= 1
      end
      arr[prev + 1] = e1
    end
  end
end
