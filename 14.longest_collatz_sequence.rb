def calc_collatz_sq_length(num, count = 0)
  return count if num.eql?(1)

  if (num % 2).eql?(0)
    calc_collatz_sq_length(num / 2, count + 1)
  else
    calc_collatz_sq_length(((3 * num) + 1), count + 1)
  end
end

max = [0, 0]

(1..1_000_000).each do |num|
  len = calc_collatz_sq_length(num)
  max = [num, len] if len > max[1]
  p [num, calc_collatz_sq_length(num)]
end

puts "max len : #{max[1]} when start with #{max[0]}"
