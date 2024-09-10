def smallest_multiple(num, prod = 1, current_factor = 1)
  # take a number in the range
  # if it is divisible by existing factors, go to the next
  # find the uncommon factors and add them to the list - does this work for prime cases?
  return prod if current_factor > num

  unless (prod % current_factor).eql?(0)
    # find gcd of prod, current factor
    # divide current factor by gcd to get delta
    # multip delta to prod

    prod *= current_factor
    unless prime?(current_factor)
      gr8st_com_div = gcd(current_factor, prod)
      # puts "cf:#{current_factor} ,p: #{prod}, gcd: #{gr8st_com_div}"
      prod /= gr8st_com_div
    end
  end

  # puts "before next call: #{prod}"
  smallest_multiple(num, prod, current_factor + 1)
end

def gcd(num1, num2)
  ((1..[num1, num2].min).filter { |div| (num1 % div).eql?(0) && (num2 % div).eql?(0) })[-2]
end

def prime?(num)
  return false if num < 2

  (Math.sqrt(num) - 1).floor.times do |i|
    return false if (num % (i + 2)).eql?(0)
  end
  true
end
puts smallest_multiple(20)

# p gcd(265, 72)
