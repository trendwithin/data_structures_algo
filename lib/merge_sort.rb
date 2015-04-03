class MergeSort
  def merge_sort(arr)
    return arr if arr.size <= 1
    left = arr[0, (arr.size / 2.0).round]
    right = arr - left
    merge(merge_sort(left), merge_sort(right))
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      sorted << (left.first < right.first ? left.shift : right.shift)
    end
    sorted.concat(left).concat(right)
  end
end
