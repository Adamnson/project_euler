require "./helper"
specials = []
limit = 9 * factorial(9)
sum_digit_factorials = lambda { |number|
  number.to_s.chars
        .map(&:to_i)
        .map { |digit| factorial(digit) }
        .inject(:+)
        .eql?(number)
}

(1..limit).each do |num|
  specials.append(num) if sum_digit_factorials.call(num)
end

p specials
# since 1 and 2 are included, inject is offset by -3
p specials.inject(-3, :+)
