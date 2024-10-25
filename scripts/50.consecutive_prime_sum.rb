require_relative "../helpers/helper"

t0 = Time.now
primes = (1..100_000).filter(&:prime?)
puts " #{Time.now - t0}, #{primes.size}"

max_prime = [0, 0]
primes_sum = 0

t0 = Time.now
limit = 1_000_000
(500..600).each do |sequence_length| # range optimised for run time
  primes_sum = primes.map    { |p| [p, primes.slice(primes.index(p), sequence_length)] }
                     .reject { |arr| arr.last.size < sequence_length }
                     .map    { |arr| [arr.first, arr.last.inject(:+)] }
                     .filter { |sum| (sum.last < limit) && sum.last.prime? }
  max_prime = [primes_sum, sequence_length] if (sequence_length > max_prime.last) && !primes_sum.empty?
end

p "#{Time.now - t0} #{max_prime}"

# p primes.filter { |p| p < 1_000_000 }.max
