require_relative "../helpers/helper"

def sum_of_primes_under(limit)
  (1..limit).to_a.filter(&:prime?).inject(:+)
end

puts sum_of_primes_under(10)
puts sum_of_primes_under(2_000_000)
