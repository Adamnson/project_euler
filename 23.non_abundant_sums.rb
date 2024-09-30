require "./helper"

UPPER_LIMIT = 28_123

abundant_num = []
(1..30_000).each do |itr|
  abundant_num.append(itr) if get_factors(itr).inject(-itr, :+) > (itr)
end

p abundant_num.count
abndnt_sums = abundant_num.product(abundant_num)
                          .map { |num_pair| num_pair.inject(:+) }
                          .filter { |s| s < UPPER_LIMIT }
                          .uniq

p "no of nos: #{abndnt_sums.count},  max: #{abndnt_sums.max}"
p "all in? #{abndnt_sums.all? { |el| el < UPPER_LIMIT }}"
sum_all = UPPER_LIMIT * (UPPER_LIMIT - 1) / 2
ans = sum_all - abndnt_sums.inject(:+)
p ans

non_abndnt_sums = (1..UPPER_LIMIT).filter { |num| !abndnt_sums.include?(num) }
p non_abndnt_sums.inject(:+) - 28_123
