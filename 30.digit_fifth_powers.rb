num = 1634
power = 5
limit = 1_000_000

place_value = lambda { |number|
  number.to_s
        .chars
        .map
        .each_with_index { |i, idx| i.to_i * (10**((num.to_s.length - 1) - idx)) }
}

p place_value.call(num)

digit_power = lambda { |number, pwr = power|
  number.to_s
        .chars
        .map { |i| i.to_i.pow(pwr) }
        .inject(:+)
}

specials = (1..limit).filter { |n| n.eql?(digit_power.call(n)) }
p specials
puts "ans is #{specials.inject(-1, :+)}" # since we do not include 1 in the list
