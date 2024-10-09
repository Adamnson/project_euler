class Integer
  def prime?
    return false if self < 2

    (Math.sqrt(self) - 1).floor.times do |i|
      return false if modulo(i + 2).eql?(0)
    end
    true
  end

  def !
    return 1 if eql?(0)
    return self if self < 2

    self * (self - 1).!
  end
end

# def prime?(num)
#   num.prime?
# end

# def factorial(num)
#   return 1 if num.eql?(0)
#   return num if num < 2

#   num * factorial(num - 1)
# end

def nCr(n, r) # rubocop:disable Naming/MethodParameterName,Naming/MethodName
  n.! / (r.! * (n - r).!)
end

def sum_of_digits(num)
  sum = 0
  while num.positive?
    sum += num % 10
    num /= 10
  end
  sum
end

def get_factors(num)
  (1..num).filter { |div| (num.modulo div).eql?(0) }
end

puts get_factors(12)
