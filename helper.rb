class Integer
  def prime?
    return false if self < 2

    (Math.sqrt(self) - 1).floor.times do |i|
      return false if (self % (i + 2)).eql?(0)
    end
    true
  end
end

# def prime?(num)
#   num.prime?
# end

def factorial(num)
  return 1 if num.eql?(0)
  return num if num < 2

  num * factorial(num - 1)
end

def nCr(n, r) # rubocop:disable Naming/MethodParameterName,Naming/MethodName
  factorial(n) / (factorial(r) * factorial(n - r))
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
  (1..num).filter { |div| (num % div).eql?(0) }
end
