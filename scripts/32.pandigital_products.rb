basis = %w[1 2 3 4 5 6 7 8 9]

# take one array with permutations(2) and another with permutaion(3) of the remaining
# check if the product of the two exists in the permuation of the remaining
factor1 = basis.permutation(1)
factor2 = basis.permutation(2)
factor3 = basis.permutation(3)
factor4 = basis.permutation(4)
# factor5 = basis.permutation(5)

get_specials = lambda { |perm1, perm2|
  specials = []
  perm1.each do |f1|
    perm2.each do |f2|
      unless f2.intersect?(f1) # rubocop:disable Style/Next

        t1 = f1.inject(:+).to_i
        t2 = f2.inject(:+).to_i
        f3 = (t1 * t2).to_s.chars
        # p [t1, t2, (t1 * t2), f1.union(f2)]
        if (basis - f1.union(f2)).permutation.include?(f3)
          products = specials.map { |el| el.inject(:*) }.flatten
          specials.append([t1, t2]) unless products.include?(t1 * t2)
          # puts "#{t1} x #{t2} = #{t1 * t2}"
        end
      end
    end
  end
  specials
}
pandigial_products = []
# pandigial_products.append(get_specials.call(factor2, factor2))
# pandigial_products.append(get_specials.call(factor3, factor3))
# pandigial_products.append(get_specials.call(factor2, factor4))
# pandigial_products.append(get_specials.call(factor3, factor4))
# pandigial_products.append(get_specials.call(factor4, factor4))
# pandigial_products.append(get_specials.call(factor1, factor5))
# pandigial_products.append(get_specials.call(factor2, factor5))
pandigial_products.append(get_specials.call(factor2, factor3))
pandigial_products.append(get_specials.call(factor1, factor4))

pandigial_products = pandigial_products.reject(&:empty?).flatten.each_slice(2).to_a
p pandigial_products
pandigial_products.each do |facts|
  puts "#{facts.first} x #{facts.last} = #{facts.first * facts.last}"
end
puts "ans: #{pandigial_products.map { |el| el.inject(:*) }.flatten.inject(:+)}"
