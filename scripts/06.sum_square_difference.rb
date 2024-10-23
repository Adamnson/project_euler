def ssd(num, sum_of_squares = 0, sum = 0)
  return (sum**2) - sum_of_squares if num.eql?(0)

  ssd(num - 1, sum_of_squares + (num**2), sum + num)
end

puts ssd(100)
