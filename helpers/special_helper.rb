class Float
  def int?
    eql?(ceil.to_f)
  end
end

class Integer
  def triangle
    self * (self + 1) / 2
  end

  def square
    self**2
  end

  def pentagon
    self * ((3 * self) - 1) / 2
  end

  def hexagon
    self * ((2 * self) - 1)
  end

  def heptagon
    self * ((5 * self) - 3) / 2
  end

  def octagon
    self * ((3 * self) - 2)
  end

  # returns float or nil
  # Tn = n(n + 1)/2
  # 2Tn = n**2 + n
  # n**2 + n - 2Tn = 0
  def triangle_idx
    get_positive_root(1, 1, -2 * self)
  end

  # returns float or nil
  # Sn = n**2
  # n**2 - Sn = 0
  def square_idx
    get_positive_root(1, 0, -self)
  end

  # returns float or nil
  # Pn = n(3*n - 1)/2
  # 2Pn = 3n**2 - n
  # 3n**2 - n -2Pn = 0
  def pentagon_idx
    get_positive_root(3, -1, -2 * self)
  end

  # returns float or nil
  # Hn = n(2*n - 1)
  # Hn = 2n**2 - n
  # 2n**2 - n - Hn = 0
  def hexagon_idx
    get_positive_root(2, -1, -self)
  end

  # returns float or nil
  # Hp = n(5*n -3)/2
  # 2Hp = 5n**2 - 3*n
  # 5n**2 - 3*n - 2Hp = 0
  def heptagon_idx
    get_positive_root(5, -3, -2 * self)
  end

  # returns float or nil
  # On = n(3*n - 2)
  # On = 3n**2 - 2n
  # 3n**2 - 2*n - On = 0
  def octagon_idx
    get_positive_root(3, -2, -self)
  end

  def get_positive_root(a, b, c)
    det = Math.sqrt((b**2) - (4 * a * c))
    [-b + det, -b - det].map! { |i| i / (2 * a) }
                        .filter { |j| j.positive? && j.int? }
                        .shift
  end
end

# #ARCHIVES
# # t_n = T =  n (n + 1) / 2
# # n^2 + n - 2T
# # r1, r2 = (-1 +- sqrt(1 - (4)(1)(-2T)) ) / 2
# triangle = ->(number) { number * (number + 1) / 2 }
# inv_triangle = lambda { |number|
#   det = Math.sqrt(1 + (8 * number))
#   [-1 + det, -1 - det].map! { |i| i / 2 }
#                       .filter { |j| j.positive? && j.int? }
#                       .shift
# }
#
# # p_n = P = n (3*n - 1) / 2
# # 3n^2 - n - 2P
# # r1,r2 = (1 +- sqrt(1 - 4(3)(-2p)) )/6
#
# pentagon = ->(number) { number * ((3 * number) - 1) / 2 }
# inv_pentagon = lambda { |number|
#   det = Math.sqrt(1 + (24 * number))
#   [1 + det, 1 - det].map! { |i| i / 6 }
#                     .filter { |j| j.positive? && j.int? }
#                     .shift
# }
#
# # Hn = H = n(2*n - 1)
# # 2n*2 - n - H
# # r1, r2 = (1 +- sqrt(1 - (4)(2)(-H)) )/ 4
#
# hexagon = ->(number) { number * ((2 * number) - 1) }
# inv_hexagon = lambda { |number|
#   det = Math.sqrt(1 + (8 * number))
#   [1 + det, 1 - det].map! { |i| i / 4 }
#                     .filter { |j| j.positive? && j.int? }
#                     .shift
# }
#
# #checks for triangles
# 1.upto(10).each do |i|
# puts triangle.call i
# end
#
# puts "calling 55 #{inv_triangle.call(55)}"
# #checks for inverse of triangle if traingle
# (1..1000).each do |j|
# p "we have #{j} is #{inv_triangle.call(j).to_i} " unless inv_triangle.call(j).nil?
# end
#
# #checks for pentagonals
# 1.upto(10).each do |i|
#   puts pentagon.call i
# end
#
# #checks for inverse of pentagonal if pentagonal
# (1..1000).each do |j|
#   p "we have #{j} is #{inv_pentagon.call(j).to_i} " unless inv_pentagon.call(j).nil?
# end
