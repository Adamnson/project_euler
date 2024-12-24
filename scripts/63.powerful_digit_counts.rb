# 63

# class Float
#   def correct_round
#     case to_s.split(".").last[..5]
#     when "000000"
#       floor.to_f
#     when "999999"
#       ceil.to_f
#     else
#       self
#     end
#   end
# end

# puts 5.000000.correct_round
# puts 4.999999.correct_round
# power_digit_counts = lambda { |n|
#   start = 10.pow(n - 1).pow(1.0 / n)
#   limit = (10.pow(n) - 1).pow(1.0 / n)
#   puts "#{n}: #{start}..#{limit} size: #{(start..limit).size}"
#   # puts "#{n}-range : #{start} - #{limit}"
#   # (start..limit).to_a.map { |num| num.pow(1.0 / n).correct_round }
#   #               # .filter { |sq_rt| sq_rt.to_s.size == (n + 1) }
#   (start..limit).size
# }

# puts (1..308).to_a.map { |num| power_digit_counts.call(num) }.inject(:+)
# [309].map { |num| power_digit_counts.call(num) }.inject(:+)
