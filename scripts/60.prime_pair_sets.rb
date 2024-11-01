require_relative "../helpers/helper"

prime_pairs = lambda { |prime_arr|
  prime_arr.permutation(2).map do |el|
    (el.first.to_s + el.last.to_s).to_i.prime? && (el.last.to_s + el.first.to_s).to_i.prime?
  end.all?
}

arr = [3, 7, 109, 673]
puts prime_pairs.call(arr)
# one
# primes = (1..1000).to_a.filter(&:prime?)
#
# set2 = primes.repeated_combination(2).filter { |el| prime_pairs.call(el) }
#
# filter_into_next_dimension = lambda { |lower_dimension_set, n|
#   set_unfiltered = lower_dimension_set.product(primes).flatten.each_slice(n)
#   # p set_unfiltered
#   p [set_unfiltered.size, lower_dimension_set.size, primes.size]
#   t0 = Time.now
#   ret_val = set_unfiltered.filter { |el| prime_pairs.call(el) }
#   puts "#{Time.now - t0} to arrive at #{ret_val.size}"
#   ret_val
# }
# one
# n = 3
# prev_dimension = set2
# prev_dimension = primes
# while n < 5
#   next_dimension = filter_into_next_dimension.call(prev_dimension, n)
#   p "n=#{n}"
#   prev_dimension = next_dimension
#   n += 1
# end
#
# p prev_dimension.map { |el| el.inject(:+) }.min

# two
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

primes = (1..10_000).to_a.filter(&:prime?)
t0 = Time.now
updated_primes = primes.map { |p| [p, []] }
primes.each do |p|
  primes.each do |t|
    updated_primes[primes.index(p)].last.append(t) if prime_pairs.call([p, t])
  end
end
t1 = Time.now

p updated_primes.size
updated_primes.map { |el| puts "#{el.first} : #{el.last.size}" }
# arr.map { |p| primes.index(p) }.map { |idx| p updated_primes[idx].last }

# start with a prime number
# gets its prime_pair possibilities
# select common numbers from the prime pair sets of the two new concats
# if common numbers are also in prime pair possibilities of the original, add them to specials

t2 = Time.now
pair_with_commons = primes.permutation(2).map do |el|
  first_prime_pair_possibilities = updated_primes[primes.index(el.first)].last
  second_prime_pair_possibilities = updated_primes[primes.index(el.last)].last
  commons = first_prime_pair_possibilities.intersection(second_prime_pair_possibilities)
  el.append(commons)
end
t3 = Time.now
sets3k = pair_with_commons.reject { |el| el.last.size < 2 }
                          .map(&:flatten).map(&:sort).uniq
                          .filter { |el| prime_pairs.call(el) }
                          .map { |el| p el }
                          .filter { |el| el.size == 5 }
                          .map { |el| puts "famous 5: #{el}" }
puts sets3k.size
t4 = Time.now
puts "Times:"
puts "1) creating updated_primes index : #{t1 - t0}"
puts "2) creating pair_with_commons : #{t3 - t2}"
puts "3) filtering pair_with_commons: #{t4 - t3}"

# famous 5: [13, 5197, 5701, 6733, 8389]
# 1
# Times: 10k
# 1) creating updated_primes index : 118.863740431
# 2) creating pair_with_commons : 8.966005924
# 3) filtering pair_with_commons: 869.009575469

# Times: 2k
# 1) creating updated_primes index : 2.542129401
# 2) creating pair_with_commons : 0.131972026
# 3) filtering pair_with_commons: 4.429328679

# Times: 3k
# 1) creating updated_primes index : 7.100517575
# 2) creating pair_with_commons : 0.418832004
# 3) filtering pair_with_commons: 16.46392098

# Times: 4k
# 1) creating updated_primes index : 13.211727946
# 2) creating pair_with_commons : 0.863371024
# 3) filtering pair_with_commons: 32.859381679

# Times: 5k
# 1) creating updated_primes index : 24.068488305
# 2) creating pair_with_commons : 1.462368281
# 3) filtering pair_with_commons: 74.325850326

# Times: 6k
# 1) creating updated_primes index : 43.913623521
# 2) creating pair_with_commons : 2.983954764
# 3) filtering pair_with_commons: 135.659209472
