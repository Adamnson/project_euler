def palindrome?(num)
  num.to_s.eql?(num.to_s.reverse)
end

def largest_product(int_a, int_b, ans = [])
  prod = int_a * int_b
  ans.append(prod) if palindrome?(prod)
  if int_b > 900
    largest_product(int_a, int_b - 1, ans)
  elsif int_a > 950
    largest_product(int_a - 1, 999, ans)
  end
  ans
end

puts largest_product(999, 999).max
