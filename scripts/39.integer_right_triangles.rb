require_relative("../helpers/special_helper")

triplets = (1..1000).to_a

triplets = triplets.product(triplets)
                   .map { |pair| pair.append(Math.sqrt(pair.first.pow(2) + pair.last.pow(2))) }
                   .filter { |el| el[2].int? }

p triplets.size
triplets.map { |el| p el if el.inject(:+).eql?(120.0) } # proof of double occurance
sum_counts = triplets.map { |tri| tri.inject(:+) }
                     .map(&:to_i)
                     .map { |sum| [sum, triplets.map { |tri| tri.inject(:+) }.count(sum)] }
                     .map { |arr| [arr.first, arr.last / 2] } # correcting double count
                     .uniq
ans = [0, 0]

sum_counts.each do |el|
  ans = el if el.first <= 1000 && el.last > ans.last
end
p "ans #{ans}"
