def palindrome?(str)
  str.eql?(str.reverse)
end

nums = []
pals = []
(1..1_000_000).each do |itr|
  nums = [itr, itr.to_s(2)]
  nums.append(nums.map { |n| palindrome?(n.to_s) })
  p nums
  pals.append(nums[0..1]) if nums[2].all?
end

p pals, pals.count
p "sum : #{pals.map { |arr| arr[0].to_i }.inject(:+)}"
