require "./helper"

def get_power(divisor, p)
  n = 0
  pn = p
  while (divisor % pn).eql?(0)
    n += 1
    pn = p**n
  end
  n - 1
end

def get_prime_factorization(divisor)
  get_factors(divisor).filter { |p| prime?(p) }
                      .map { |q| [q, get_power(divisor, q)] }
end

num_divs = [0, [0]]
n = 1
while n < 1000
  tri_num = n * (n + 1) / 2
  factors = get_factors(tri_num)
  num_divs = [n, tri_num, factors.count, get_prime_factorization(factors.max)] if factors.count > num_divs[-1].count
  n += 1
end
p num_divs

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
