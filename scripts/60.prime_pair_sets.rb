require_relative "../helpers/helper"

prime_pairs = lambda { |prime_arr|
  prime_arr.permutation(2).map do |el|
    (el.first.to_s + el.last.to_s).to_i.prime? && (el.last.to_s + el.first.to_s).to_i.prime?
  end.all?
}

arr = [3, 7, 109, 673]
puts prime_pairs.call(arr)

primes = (1..1000).to_a.filter(&:prime?)

set2 = primes.repeated_combination(2).filter { |el| prime_pairs.call(el) }

filter_into_next_dimension = lambda { |lower_dimension_set, n|
  set_unfiltered = lower_dimension_set.product(primes).flatten.each_slice(n)
  # p set_unfiltered
  p [set_unfiltered.size, lower_dimension_set.size, primes.size]
  t0 = Time.now
  ret_val = set_unfiltered.filter { |el| prime_pairs.call(el) }
  puts "#{Time.now - t0} to arrive at #{ret_val.size}"
  ret_val
}
# one
n = 3
prev_dimension = set2
# prev_dimension = primes
while n < 5
  next_dimension = filter_into_next_dimension.call(prev_dimension, n)
  p "n=#{n}"
  prev_dimension = next_dimension
  n += 1
end

p prev_dimension.map { |el| el.inject(:+) }.min

# n = 2
# prev_dimension = primes.filter { |el| el < 1000 }
# while n < 4
#   next_dimension = filter_into_next_dimension.call(prev_dimension, n)
#   p "n=#{n}"
#   prev_dimension = next_dimension
#   n += 1
# end

# set1000 = prev_dimension

# prev_dimension = primes.filter { |el| el > 1000 }
# n = 2
# while n < 4
#   next_dimension = filter_into_next_dimension.call(prev_dimension, n)
#   p "n=#{n}"
#   prev_dimension = next_dimension
#   n += 1
# end

# set2000 = prev_dimension
