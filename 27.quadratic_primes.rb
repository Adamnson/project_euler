require "./helper"

#  n^2 + n + 41
# determinant is -ve
#
# n^2 - 79n + 1601
# determinant is -ve
# _
# n^2 + an + b
# r1,r2 = (-a +- sqrt(a^2-4.b)) / 2
#

coeffs = (-999...1000).to_a
                      .product((-1000..1000).to_a)
                      .filter { |a_b| a_b.first.pow(2) < 4 * a_b.last }

p coeffs.size

quadratic = lambda { |ab, num|
  (num**2) + (ab.first * num) + ab.last
}

populate = lambda { |ab, range|
  (0..range).map { |num| quadratic.call(ab, num) }
            .filter(&:prime?)
}

limit = 71

p(coeffs.map { |el| populate.call(el, limit) }
      .reject!(&:empty?)
      .filter { |el| el.size.eql? limit })

# 1 + a + b = 911
# 4 + 2a + b = 853
# a + 3 = 853 - 911
# a = = -61
# b = 911 + 61 - 1 = 971

eqn = ->(num) { (num**2) - (61 * num) + 971 }

(1..10).map { |i| puts eqn.call(i) }

puts "#{971 * -61}"
puts(populate.call([-61, 971], limit).all? { |el| el.prime? })
