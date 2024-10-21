require "./helper"

# class Float
#   def pow(n)
#     return 1 if n.eql? 0

#     ret_val = self
#     (n - 1).times do
#       ret_val *= self
#     end
#     ret_val
#   end
# end

# p(0.912.pow(10))

# three

fractional_string = lambda { |denominator|
  str = ""
  str_length = 100
  first_occurance = true
  long_pattern = false
  hit = start_idx = diff = 0
  pattern = rep = ""
  count = 0
  (1..str_length).each do |i|
    digit = ((10.pow(i) / denominator).modulo 10).to_s
    if str.include?(digit) && first_occurance
      hit = str.index(digit)
      # start_idx = i
      diff = str.length - hit
      first_occurance = false
      pattern = str.slice(hit, diff)
      count += 1
      digit = "(#{digit})"
      long_pattern = diff > 1
      # puts "hit found for #{i}, hit: #{hit}, diff: #{diff}, pattern: #{pattern}"
    elsif str.include?(digit) && pattern.include?(digit)
      # validate it is a repeating pattern and not just a random appearance in a non repeating sequence
      rep += digit
      if (count == diff) && !long_pattern
        digit = "(#{digit})"
        rep = ""
      else
        count += 1
        str += "(#{pattern})" if count == diff
        rep = "" if count == diff
        count = 1 if count == diff
      end
    end
    str += digit unless long_pattern
  end
  str
}
longest = ""
max_len = d = 0
# [7, 11, 13].each do |number|
numbers = (1..100).to_a - [88, 104, 108]
numbers.each do |number|
  num_string = fractional_string.call(number)
  puts "1/#{number} : #{num_string}"
  var = Regexp.new("([0-9]+)")
  repeating_pattern = num_string.split(var)
  # repeating_pattern.delete(")(")
  # repeating_pattern.delete("(")
  # repeating_pattern.delete(")")
  # repeating_pattern.delete("")
  # p repeating_pattern
  longest_in_pattern = repeating_pattern.map(&:size).max
  if longest_in_pattern > max_len
    max_len = longest_in_pattern
    longest = repeating_pattern.filter { |el| el.size == max_len }
    d = number
  end
  p longest
end

puts "d: #{d}, pattern: #{longest}"
# specials = []
# (1..10).each do |number|
#   num_string = fractional_string.call(number)
#   # puts number, num_string
#   # from the end of the string
#   prev_hit = num_string.length
#   prev_hit = num_string.reverse.index(num_string[-1], 1) || prev_hit
#   sub_str1 = num_string[(num_string.length - prev_hit)..]
#   puts "r: #{prev_hit} #{sub_str1}"
#   # from the start of the string  - additional complexity
#   next_hit = 0
#   next_hit = num_string.index(num_string[0], 1) || next_hit
#   sub_str2 = num_string[0..next_hit]
#   puts "f: #{next_hit} #{sub_str2}"
#
#   # sub_str2 = num_string[(num_string.length - (2 * prev_hit)), sub_str1.length]
#
#   # if num_string.split(sub_str1).count >= 2
#   #   specials.append([number, num_string, sub_str1,
#   #                    num_string.split(sub_str1).count])
#   # end
# end
# puts specials.count
# two

# (1..10).each do |denominator|
#   frac = (1.0 / denominator)
#   string100 = ""
#   25.times do
#     # puts " #{frac}, #{(frac.modulo 10).truncate(10)}"
#     string100.concat((frac.modulo 10).to_s)
#     frac *= 10
#   end

#   # p [denominator, string100.size, string100.count(".")]
#   p string100
# end
# one
# max = [0, 0]
# rep_index = -1
# match_index = frac.to_s.size
# length = 0
# puts "i: #{denominator} frac: #{frac} "
# match_index = frac.to_s.reverse.index(frac.to_s[-2], 2) || match_index
# rep_index = frac.to_s.reverse.index(frac.to_s[-2], 2 + match_index) unless match_index.nil?
# length = (match_index - 1) unless match_index.nil?
# if !rep_index.nil? && frac.to_s[rep_index, length].eql?(frac.to_s[match_index, length]) && length > (max[1])
#   max = [denominator, length, frac.to_s[-2 - match_index, length]]
# end

# puts "max rep cycle : #{max}"
