class Sort
  class << self
    def merge_sort(arr)
      return arr if arr.size < 2
      half  = arr.size / 2
      left  = arr.first half
      right = arr.drop half
      merge(merge_sort(left), merge_sort(right))
    end

    def merge(left, right)
      sorted_array = Array.new
      until left.empty? or right.empty?
        elem = left.first < right.first ? left.shift : right.shift
        sorted_array << elem
      end
      sorted_array + left + right
    end
  end
end