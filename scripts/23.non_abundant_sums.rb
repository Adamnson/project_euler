require "./helpers/helper"

UPPER_LIMIT = 28_123
t1 = Time.now
abundant_num = (1..30_000).filter { |i| i.factors.inject(-i, :+) > i }
t2 = Time.now
puts "t1: #{t2 - t1}"
p abundant_num.count
abndnt_sums = abundant_num.product(abundant_num)
                          .map { |num_pair| num_pair.inject(:+) }
                          .filter { |s| s < UPPER_LIMIT }
                          .uniq
t3 = Time.now
puts "t2: #{t3 - t2}"
p "no of nos: #{abndnt_sums.count},  max: #{abndnt_sums.max}"
p "all in? #{abndnt_sums.all? { |el| el < UPPER_LIMIT }}"
sum_all = UPPER_LIMIT * (UPPER_LIMIT - 1) / 2
ans = sum_all - abndnt_sums.inject(:+)
p ans

non_abndnt_sums = (1..UPPER_LIMIT).filter { |num| !abndnt_sums.include?(num) }
p non_abndnt_sums.inject(:+) - 28_123
