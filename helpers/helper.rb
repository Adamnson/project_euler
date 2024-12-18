class Integer
  def prime?
    return false if self < 2

    (Math.sqrt(self) - 1).floor.times do |i|
      return false if modulo(i + 2).eql?(0)
    end
    true
  end

  def composite?
    !prime?
  end

  def !
    return 1 if eql?(0)
    return self if self < 2

    self * (self - 1).!
  end

  def C(r)
    self.! / (r.! * (self - r).!)
  end

  def factors
    (1..Math.sqrt(self).ceil).map { |div| [div, self / div] if modulo(div).eql?(0) }
                             .compact
                             .flatten.uniq
  end
end

def sum_of_digits(num)
  sum = 0
  while num.positive?
    sum += num.modulo 10
    num /= 10
  end
  sum
end

class Array
  # returns a number with the digits of the array
  def to_i
    map.each_with_index { |dig, idx| dig * 10.pow(size - 1 - idx) }.inject(:+)
  end
end

# #ARCHIVES
# def prime?(num)
#   num.prime?
# end

# def factorial(num)
#   return 1 if num.eql?(0)
#   return num if num < 2

#   num * factorial(num - 1)
# end

# def get_factors(num)
#   (1..num).filter { |div| (num.modulo div).eql?(0) }
# end
