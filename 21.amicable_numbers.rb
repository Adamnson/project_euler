require "./helper"

sum = 0
(1..10_000).each do |itr|
  dn1 = get_factors(itr).inject(-itr, :+)
  dn2 = get_factors(dn1).inject(-dn1, :+)
  next unless dn2.eql?(itr) && dn1 != itr

  p "d(#{itr}): #{dn1} amicable with d(#{dn1}): #{dn2} "
  sum += itr
  # another way to do this is to add dn1 as well and skip
  # it later in the loop; maybe also store the numbers pairs
end

puts "sum is #{sum}"
