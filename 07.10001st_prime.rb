require "./helper"

count = 0
num = 1
prime_nos = []
while count < 10_001
  if prime?(num)
    count += 1
    prime_nos.append(num)
  end
  num += 1
end
puts prime_nos.max
