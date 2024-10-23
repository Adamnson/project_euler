basis = %w[1 2 3 4 5 6 7 8 9]

specials = []
(1..100_000).each do |int|
  product_string = ""
  multiplicand = 1
  while product_string.length < 10
    product_string += (int * multiplicand).to_s
    break if product_string.length.eql?(9)

    multiplicand += 1
  end
  next if product_string.chars.uniq.length < product_string.length

  specials.append([int, multiplicand, product_string]) if basis.permutation.include?(product_string.chars)
end

p specials
p specials.count
puts specials.map { |el| el[2].to_i }.max
