def S(n, m)
  arr = (2..n).to_a
  p "* : #{arr}"
  (1..m).each do |i|
    arr[arr.index(arr.min)] = arr.min.pow(2)
    p "#{i} : #{arr}"
  end
  arr
end

t0 = Time.now
result = S(5, 10)
puts "time: #{Time.now - t0} : #{result.inject(:+)}"

# t0 = Time.now
# result = S(10, 100)
puts "time: #{Time.now - t0} : #{result.inject(:+).modulo(1_234_567_891)}"
p(result.map { |el| el.size })
#
# t0 = Time.now
# result = S(10.pow(4), 10.pow(5))
# puts "time: #{Time.now - t0} : #{result.inject(:+).modulo(1_234_567_891)}"

# by_algo = S(10.pow(4), 10.pow(4))
# by_pattern = S(10.pow(4), 1).map { |el| el.pow(2) }
# p "algo #{by_algo}"
# p "pattern #{by_pattern}"

# puts by_algo.eql?(by_pattern)
