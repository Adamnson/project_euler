basis = (0..9).to_a
primes = [2, 3, 5, 7, 11, 13, 17]
specials = []
basis.permutation.each do |num|
  next if num[0].eql?(0)

  prods = num.map.each_with_index do |dig, idx|
    (dig * 100) + (num[idx + 1] * 10) + num[idx + 2] if (1..7).include?(idx)
  end.compact.map.each_with_index do |sum, idx|
    sum.modulo(primes[idx])
  end
  specials.append(num) if prods.all?(0)
end

p "number of pandigitals : #{specials.size}"
p specials
nums = specials.map { |arr| arr.map.each_with_index { |dig, idx| dig * 10.pow(9 - idx) }.inject(:+) }
p nums
p "ans : #{nums.inject(:+)}"
