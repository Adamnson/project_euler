def add_to_fraction(fraction, number)
  [fraction.first + (number * fraction.last), fraction.last]
end

def calc_root_two(n, accumulator = [1, 2])
  return add_to_fraction(accumulator, 1) if n == 1

  accumulator = if accumulator == [1, 2]
                  add_to_fraction([1, 2], 2)
                else
                  add_to_fraction(accumulator, 2)
                end

  calc_root_two(n - 1, accumulator.reverse)
end

# p calc_root_two(1)
# p calc_root_two(2)
# p calc_root_two(3)
# p calc_root_two(4)

puts "ans", (1..1000).to_a.map { |num| calc_root_two(num) }
                     .filter { |fraction_arr| fraction_arr.first.to_s.size > fraction_arr.last.to_s.size }
                     .size
              # .map {|el| p el}
