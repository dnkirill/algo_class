# ruby-1.9.2-p290 :061 > bench_it.call 100 #=>   0.000000   0.000000   0.000000 (  0.001491)
# ruby-1.9.2-p290 :062 > bench_it.call 1000 #=>   0.010000   0.000000   0.010000 (  0.011283)
# ruby-1.9.2-p290 :063 > bench_it.call 10000 #=>   0.090000   0.010000   0.100000 (  0.097522)
# ruby-1.9.2-p290 :064 > bench_it.call 100000 #=>   1.000000   0.010000   1.010000 (  1.000189)
# ruby-1.9.2-p290 :065 > bench_it.call 1000000 #=>  12.060000   0.070000  12.130000 ( 12.102483)
# nlog(n)

class CountInversions
  class << self
    def count(array)
      @@inversions = 0
      sort_and_count(array)
      return @@inversions
    end

    def sort_and_count(array)
      return array if array.size <= 1
      half = array.size / 2
      left  = sort_and_count(array.first half)
      right = sort_and_count(array.drop half)
      return merge_and_count(left, right)
    end

    def merge_and_count(left, right)
      sorted = Array.new
      until left.empty? or right.empty?
        if left.first < right.first
          sorted << left.shift
        else
          sorted << right.shift
          @@inversions += left.size
        end
      end
      @@inversions
      until left.empty?
        sorted << left.shift
        # @@inversions += left.size  # BS, of course
      end
      return sorted + left + right
    end
  end
end

# gen_a = proc do |n|
#   n.times { a << rand(100000) }
# end

# bench_it = proc do |n|
#   a = []
#   gen_a.call n
#   Benchmark.measure do
#     CountInversions.count a
#   end
# end