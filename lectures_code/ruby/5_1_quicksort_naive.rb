# Brogrammer's implementation of QuickSort

class QuickSort
  def initialize(array)
    @arr = array
		p "Entry array:"
		p @arr
	end

  def sort
    quicksort(0, @arr.size - 1)
    p "Sorted array:"
		p @arr
  end

  def quicksort(start, finish)
    return if finish - start <= 1
    pivot = partition2(start, finish)
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

  # Partitioning algo from lecture
  def partition2(start, finish)
    pivot = start
    lh = rh = pivot + 1
    (rh..finish).each do |rh|
      if @arr[rh] < @arr[pivot]
        swap!(lh, rh)
        lh += 1
      end
    end
    if @arr[lh - 1] < @arr[pivot]
      swap!(lh - 1, pivot) 
      pivot = lh - 1
    end
    pivot
  end

  def swap!(el1, el2)
    @arr[el1], @arr[el2] = @arr[el2], @arr[el1]
  end
end
