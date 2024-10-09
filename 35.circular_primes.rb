require "./helper"

limit = 1_000_000
specials = []

def circular_permutaions(number)
  ret_val = []
  digits = number.to_s.chars
  0.upto(digits.size - 1) do |i|
    ret_val.append(digits[i..].concat(digits[0...i]).inject(:+).to_i)
  end
  ret_val
end

(1..limit).each do |num|
  next unless prime?(num)

  specials.append(num) if circular_permutaions(num).all? { |n| prime?(n) }
end

p specials.size, specials
