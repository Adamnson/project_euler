require "./helper"

primes = (1..100).filter { |num| prime?(num) }

p primes
init_num = 15
num_divs = []
while init_num > 1
  num_divs.append(init_num)
  init_num /= 2
end

p num_divs, num_divs.map { |i| i + 1 }.inject(:*)

puts "#{(2**15) * (3**7) * (5**3)}"
# we are looking for the first triangular number with 512 divisors
# 15 7 3           # <== distribution of powers to primes  ( I  )
puts(16 * 8 * 4)
# 3 3 7 3  # <== distribution of powers to primes   (  II  )
# 7 3 3 3
puts(8 * 4 * 4 * 4)
puts " 2^7 #{2**7}"
puts " 3^3 #{3**3}"
puts " 5^3 #{5**3}"
puts " 7^3 #{7**3}"

puts "   (2^7 5^2 )         * ( 3^3 5 7^2 )       = #{(2**7) * (5**2)}*#{(3**3) * (7**2)}      = #{(2**7) * (5**3) * (3**3) * (7**2)}"

puts(8 * 4 * 4 * 2 * 2)
# 7 3 3 1 1 # <== distribution of powers to primes   (  III  )
puts " 2^7 #{2**7}"
puts " 3^3 #{3**3}"
puts " 5^3 #{5**3}"
puts " 7^1 #{7**1}"
puts " 11^1 #{11**1}"

puts "   (2^3 )         * (2^4)       = #{2**3}*#{2**4}      = #{2**7}"
puts "   (2^3 3^2)      * (2^4 3)     = #{(2**3) * (3**2)}*#{(2**4) * 3}     = #{(2**7) * (3**3)}"
puts "   (2^3 3^2)      * (2^4 3 5)   = #{(2**3) * (3**2)}*#{(2**4) * 3 * 5}    = #{(2**7) * (3**3) * 5}"
puts "   (2^3 3^2 7)    * (2^4 3 5^2) = #{(2**3) * (3**2) * 7}*#{(2**4) * 3 * (5**2)}  = #{(2**7) * (3**3) * (5**2) * 7}"
puts "   (2^3 3^2 7 11) * (2^4 3 5^3) = #{(2**3) * (3**2) * 7 * 11}*#{(2**5) * 3 * (5**3)}  = #{(2**7) * (3**3) * (5**3) * 7 * 11}"
puts "\n \n \n"
puts "   (2^2  3^3 5^3 )         * (2^5 7 11)       = #{2 * (3**3) * (5**3)}*#{(2**6) * 7 * 11}      = #{(2**7) * (3**3) * (5**3) * 7 * 11}"

# facts =  get_factors(33_264_000)
# puts " for 33_264_000 :#{facts.filter { |num| facts.include?(num + 1) }}"
# facts = get_factors(33_264_000 * 2)
# puts " for #{33_264_000 * 2} :#{facts.filter { |num| facts.include?(num + 1) }}"
# puts 384 * 385

# two
# def get_power(divisor, p)
#   n = 0
#   pn = p
#   while (divisor % pn).eql?(0)
#     n += 1
#     pn = p**n
#   end
#   n - 1
# end

# def get_prime_factorization(divisor)
#   get_factors(divisor).filter { |p| prime?(p) }
#                       .map { |q| [q, get_power(divisor, q)] }
# end

# num_divs = [0, [0]]
# n = 1
# while n < 1000
#   tri_num = n * (n + 1) / 2
#   factors = get_factors(tri_num)
#   num_divs = [n, tri_num, factors.count, get_prime_factorization(factors.max)] if factors.count > num_divs[-1].count
#   n += 1
# end
# p num_divs

# one
# puts "Brute Force"
# n_factors = 0
# num = 000_000
# max = 0
# while n_factors < 500
#   triangular_num = num * (num + 1) / 2
#   n_factors = get_factors(triangular_num).count
#   max = n_factors if max < n_factors
#   p [triangular_num, n_factors, max]
#   num += 1
# end
#
