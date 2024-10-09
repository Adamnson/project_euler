NAME = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
         6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
         11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
         16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen",
         20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
         60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety",
         100 => "one hundred", 200 => "two hundred", 300 => "three hundred", 400 => "four hundred", 500 => "five hundred",
         600 => "six hundred", 700 => "seven hundred", 800 => "eight hundred", 900 => "nine hundred", 1000 => "one thousand" }.freeze

# (1..20).each do |idx|
#   puts NAME[idx] if NAME.keys.include?(idx)
# end

# english = get_name(115) #20
# puts english
# puts english.length - english.count(" ")
#
## english = get_name(342) #23
# puts english
# puts english.length - english.count(" ")

def get_name(num)
  return NAME[num] if NAME.keys.include?(num)
  if (num > 100) && NAME.keys.include?(num.modulo(100))
    return "#{NAME[(num.modulo 1000) - (num.modulo 100)]} and #{NAME[num.modulo 100]}"
  end

  div = 10
  digit = 0
  english = ""
  while (num * 10 / div).positive?
    digit = (num.modulo div) - num.modulo(div / 10)
    english = div >= 1000 ? "#{NAME[digit]} and #{english}" : "#{NAME[digit]} #{english}"
    # puts "#{num}, #{div}, #{digit}"
    div *= 10
  end
  english
end

sum_name_length = 0
(1..1000).each do |itr|
  english = get_name(itr)
  puts english
  sum_name_length += english.length - english.count(" ")
  # puts "#{english} length: #{english.size - english.count(' ')}"
end
puts sum_name_length
