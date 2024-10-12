# # Phase 1: brute force replication of question
# str = ""
# 1.upto(999) do |i|
#   str.concat(i.to_s)
# end
# p str.size

# #Phase 2: observing pattern, formulating approach
# till999 = (9 * 1) + ((99 - 9) * 2) + ((999 - 99) * 3)
# puts "#{(9 * 1) + ((99 - 9) * 2) + ((999 - 99) * 3)}"
# puts "#{(3000 - till999).divmod(4)}"
# puts "#{'9'[1]}"

# #Phase 3: formalizing approach, the grind
def get_digit(index)
  power = 0
  accumulator = 0
  increment = 0
  while accumulator + increment < index
    accumulator += increment
    increment = 9 * 10.pow(power) * (power + 1)
    power += 1
  end
  num_pos_arr = (index - 1 - accumulator).divmod(power)
  (10.pow(power - 1) + num_pos_arr[0]).to_s[num_pos_arr[1]].to_i
  # puts "ret_val: #{num_pos_arr} #{power}"
  # puts "number = #{10.pow(power - 1) + num_pos_arr[0]}"
  # puts "digit = #{(10.pow(power - 1) + num_pos_arr[0]).to_s[num_pos_arr[1]]}"
end

# #Test run 1
# 1.upto(15) do |i|
#   p " digit at pos #{i} #{get_digit(i)}"
# end
# #Test run 2
# 0.upto(6) do |j|
#   p "d_#{10.pow(j)} = #{get_digit(10.pow(j))}"
# end

p (0..6).map { |k| get_digit(10.pow(k)) }.inject(:*)
