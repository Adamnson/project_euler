require_relative "../helpers/helper"

ints = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

big_lambda = lambda { |basis|
  the_family = basis.permutation
                    .map { |arr| arr.inject { |sum, n| (10 * sum) + n } }.filter { |el| el > 1000 }
  # p the_family
  # p "number_of_primes: #{the_family.filter(&:prime?).count}"
  the_family.permutation(3).map(&:sort).uniq
            .reject { |triplet| triplet.map(&:composite?).any? }
            .map { |triplet| [triplet.first, triplet[1] - triplet.first, triplet.last - triplet[1]] }
            .filter { |triplet| (triplet[1].eql? triplet.last) && triplet.last.positive? }
            .map { |triplet| puts "#{triplet.first}, diff: #{triplet.last} \nnums: [#{triplet.first} #{triplet.first + triplet.last} #{triplet.first + (2 * triplet.last)}]" }
}

ints.product(ints, ints, ints).each do |b|
  big_lambda.call(b)
end
