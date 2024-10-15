require "./helper"

basis = (0..9).to_a
primes = [2, 3, 5, 7, 11, 13, 17]
specials = []

basis.permutation.each do |num|
  next if num[0].eql?(0)

  prods = num.map.each_with_index do |_dig, idx|
    num.slice(idx, 3).to_i if (1..7).include?(idx)
  end
  prods.compact!.map!.each_with_index do |sum, idx|
    sum.modulo(primes[idx])
  end

  specials.append num.to_i if prods.all?(0)
end

puts "number of pandigitals : #{specials.size}"
p specials
puts "ans : #{specials.inject(:+)}"
