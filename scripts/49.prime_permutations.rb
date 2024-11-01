require_relative "../helpers/helper"

ints = (0..9).to_a

ints.repeated_combination(4).each do |basis|
  basis.permutation
       .map(&:to_i).filter { |el| el > 1000 }
       .permutation(3).map(&:sort).uniq
       .reject { |triplet| triplet.map(&:composite?).any? }
       .map    { |triplet| [triplet.first, triplet[1] - triplet.first, triplet.last - triplet[1]] }
       .filter { |triplet| (triplet[1].eql? triplet.last) && triplet.last.positive? }
       .map    { |triplet| puts "#{triplet.first}, diff: #{triplet.last} \nnums: [#{triplet.first} #{triplet.first + triplet.last} #{triplet.first + (2 * triplet.last)}]" }
end
