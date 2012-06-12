module Sort
  def self.merge_sort(arr)
    return arr.to_a if arr.size < 2
    left_part, right_part = [], []
    arr.each_with_index do |elem, i|
      if i < arr.size / 2
        left_part << elem
      else
        right_part << elem
      end
    end
    left_array  = merge_sort(left_part)
    right_array = merge_sort(right_part)
    return merge(left_array, right_array)
  end

  def self.merge(left_array, right_array)
    p "la: #{left_array}; ra: #{right_array}"
    sorted_array = Array.new
    li, ri, la, ra = 0, 0, left_array, right_array
    while (li < la.size) && (ri < ra.size)
      left_value, right_value = la[li], ra[ri]
      if left_value < right_value
        sorted_array << left_value
        li += 1
      else
        sorted_array << right_value
        ri += 1
      end
    end
    while li < la.size
      sorted_array << la[li]
      li += 1
    end
    while ri < ra.size
      sorted_array << ra[ri]
      ri += 1
    end
    p "resulted: #{sorted_array}"
    return sorted_array
  end
end