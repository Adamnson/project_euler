def Fibonacci(n)
  return 1 if n <= 2

  Fibonacci(n - 1) + Fibonacci(n - 2)
end

def Fib(n, n1, n2)
end

# (1..12).each { |n| puts "F-#{n}: #{Fibonacci(n).to_s.size} " }

num = 1
fib_num = 1
fib_num_len = fib_num.to_s.size

while fib_num_len < 10
  num += 1
  fib_num = Fibonacci(num)
  fib_num_len = fib_num.to_s.size
  puts "f-#{num}: #{fib_num} [#{fib_num_len}]"
end
