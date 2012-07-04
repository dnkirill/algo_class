# Brogrammer's implementation of QuickSort

class QuickSort
  def initialize(array)
    @arr = array
  end

  def sort
    quicksort(0, @arr.size - 1)
    @arr
  end

  def quicksort(start, finish)
    return if start - finish == 1
    pivot = partition(start, finish)
    quicksort(start, pivot - 1)
    quicksort(pivot + 1, finish)
  end

  def partition(start, finish)
    pivot = start
    ((start + 1)..finish).each do |elem|
      if @arr[elem] <= @arr[pivot]
        @arr.insert(pivot, @arr[elem])
        @arr.delete_at(elem + 1)
        pivot += 1
      else
        @arr.insert(pivot + 1, @arr[elem])
        @arr.delete_at(elem + 1)
      end
    end
    return pivot
  end
end