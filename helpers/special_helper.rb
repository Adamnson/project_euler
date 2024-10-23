class Float
  def int?
    eql?(ceil.to_f)
  end
end

class Integer
  def triangle
    self * (self + 1) / 2
  end

  def pentagon
    self * ((3 * self) - 1) / 2
  end

  def hexagon
    self * ((2 * self) - 1)
  end

  # returns float or nil
  def triangle_idx
    det = Math.sqrt(1 + (8 * self))
    [-1 + det, -1 - det].map! { |i| i / 2 }
                        .filter { |j| j.positive? && j.int? }
                        .shift
  end

  # returns float or nil
  def pentagon_idx
    det = Math.sqrt(1 + (24 * self))
    [1 + det, 1 - det].map! { |i| i / 6 }
                      .filter { |j| j.positive? && j.int? }
                      .shift
  end

  # returns float or nil
  def hexagon_idx
    det = Math.sqrt(1 + (8 * self))
    [1 + det, 1 - det].map! { |i| i / 4 }
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
