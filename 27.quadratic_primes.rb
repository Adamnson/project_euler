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
  (1..range).map { |num| quadratic.call(ab, num) }
            .filter(&:prime?)
}

limit = 70

p(coeffs.map { |el| populate.call(el, limit) }
      .reject!(&:empty?)
      .filter { |el| el.size.eql? limit })
