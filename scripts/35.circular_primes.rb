require "./helpers/helper"

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
  next unless num.prime?

  specials.append(num) if circular_permutaions(num).all?(&:prime?)
end

p specials.size, specials
