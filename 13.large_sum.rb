NUMBERS = File.read("13.1numbers.md").split("\n")

loc = 1
p [pos: NUMBERS[0][loc], num: NUMBERS[0]]
p NUMBERS[0][loc].to_i * (10**(NUMBERS[0].size - 1 - loc))

# take a position pos in the 50 digit number
# if the digit at pos in all the 100 numbers is 9,
#   the sum of the digits would be 900 (max possible)
# thus, if you were to calculate the first 10 digitis of
# the sum of the 100 numbers, you will have to consider
# the first 12/13 (max 15 or 20) digits

def calc_first_n_digits_of_sum(n_digits)
  sum = 0
  (0..n_digits).each do |pos|
    NUMBERS.each do |num|
      sum += num[pos].to_i
    end
    sum *= 10 unless pos.eql?(n_digits)
  end
  sum
end

p [13, calc_first_n_digits_of_sum(13), calc_first_n_digits_of_sum(13).to_s[0..9],
   calc_first_n_digits_of_sum(13).to_s.size]
p [14, calc_first_n_digits_of_sum(14), calc_first_n_digits_of_sum(14).to_s[0..9],
   calc_first_n_digits_of_sum(14).to_s.size]
p [15, calc_first_n_digits_of_sum(15), calc_first_n_digits_of_sum(15).to_s[0..9],
   calc_first_n_digits_of_sum(15).to_s.size]

puts "answer is #{calc_first_n_digits_of_sum(13).to_s[0..9]}"
