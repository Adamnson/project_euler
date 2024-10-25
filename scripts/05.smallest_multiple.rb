require_relative "../helpers/helper"

def smallest_multiple(num, prod = 1, current_factor = 1)
  return prod if current_factor > num

  unless (prod.modulo current_factor).eql?(0)
    # find gcd of prod, current factor
    # divide current factor by gcd to get delta
    # multip delta to prod

    prod *= current_factor
    unless current_factor.prime?
      gr8st_com_div = gcd(current_factor, prod)
      # puts "cf:#{current_factor} ,p: #{prod}, gcd: #{gr8st_com_div}"
      prod /= gr8st_com_div
    end
  end

  # puts "before next call: #{prod}"
  smallest_multiple(num, prod, current_factor + 1)
end

def gcd(num1, num2)
  ((1..[num1, num2].min).filter { |div| (num1.modulo div).eql?(0) && (num2.modulo div).eql?(0) })[-2]
end

puts smallest_multiple(20)

# p gcd(265, 72)
