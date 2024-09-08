def fibonacci(n)
  return n if n <= 2

  fibonacci(n - 1) + fibonacci(n - 2)
end
sum = 0
i = 1
while fibonacci(i) < 4_000_000
  sum += fibonacci(i) if fibonacci(i).even?
  i += 1
end

puts sum, i
