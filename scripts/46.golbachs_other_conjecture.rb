require_relative "../helpers/helper"

primes = (1..10_000).filter(&:prime?)

squares = (1..100).map { |el| el.pow(2) }

odd_composites = (1..20_000).filter(&:odd?).filter(&:composite?)

nums = primes.product(squares)
             .map { |el| [el.first + (2 * el.last)] }
             .flatten.filter(&:odd?).reject(&:prime?)
             .uniq.sort.to_a

# p primes
# p squares
# p nums[..100]
p (odd_composites - nums)[..100]
p "ans : #{(odd_composites - nums)[1]}"
