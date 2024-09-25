def prime?(num)
  return false if num < 2

  (Math.sqrt(num) - 1).floor.times do |i|
    return false if (num % (i + 2)).eql?(0)
  end
  true
end

def factorial(num)
  return 1 if num.eql?(0)
  return num if num < 2

  num * factorial(num - 1)
end

def nCr(n, r)
  factorial(n) / (factorial(r) * factorial(n - r))
end
