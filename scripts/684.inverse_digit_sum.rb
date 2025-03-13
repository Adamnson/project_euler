require_relative("../helpers/helper")
def s(n)
  i = 1
  i += 1 until sum_of_digits(i).eql?(n)
  puts "s(#{n}) : #{i}"
  i
end

def S(n)
  sum = 0
  (1..n).to_a.map { |i| s(i) }.inject(:+)
  # sum += s(i)
  # sum
end

puts s(10)
puts S(20)
fiboncci = [0, 1]
fiboncci.append(fiboncci.last + fiboncci[-1]) while fiboncci.length <= 90
puts fiboncci[90]
answer = fiboncci.map { |fi| S(fi) }.inject(:+).modulo(1_000_000_007)
puts "answer: #{answer}"
