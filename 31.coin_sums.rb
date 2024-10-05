basis = [0, 1, 2, 5, 10, 20, 50, 100, 200]
prod_mat = basis

5.times do |i|
  prod_mat = prod_mat.product(basis)
                     .map { |el| el.inject(:+) }
                     .filter { |el| el <= 200 }
  p prod_mat.size
  # prod_mat = prod_mat.filter { |el| el > 200 }
  puts i
end

p prod_mat.size

two_pounds = prod_mat.filter { |el| el.eql?(200) }
p two_pounds.count
