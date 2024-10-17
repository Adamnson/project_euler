# t_n = T =  n (n + 1) / 2
# n^2 + n - 2T
# r1, r2 = (-1 +- sqrt(1 - (4)(1)(-2T)) ) / 2
triangle = ->(number) { number * (number + 1) / 2 }
inv_triangle = lambda { |number|
  det = Math.sqrt((8 * number) + 1)
  [-1 + det, -1 - det].map! { |i| i / 2 }
                      .filter { |j| j.positive? && j.is_int? }
                      .shift
}

# p_n = P = n (3*n - 1) / 2
# 3n^2 - n - 2P
# r1,r2 = (1 +- sqrt(1 - 4(3)(-2p)) )/6

pentagon = ->(number) { number * ((3 * number) - 1) / 2 }
inv_pentagon = lambda { |number|
  det = Math.sqrt(1 + (24 * number))
  [1 + det, 1 - det].map! { |i| i / 6 }
                    .filter { |j| j.positive? && j.is_int? }
                    .shift
}
