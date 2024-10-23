require_relative "../helpers/helper"

distinct_primes = ->(numbers, limit) { numbers.map { |n| n.factors.filter(&:prime?).count.eql?(limit) } }

limit = 2
(1..25).each do |num|
  puts num if distinct_primes.call(num.upto(num + 1), limit).all?
end

limit = 3
(1..1000).each do |num|
  puts num if distinct_primes.call(num.upto(num + 2), limit).all?
end

limit = 4
(100_000..150_000).each do |num|
  puts "ans: #{num}" if distinct_primes.call(num.upto(num + 3), limit).all?
end
